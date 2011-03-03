Received: from relay1.mentorg.com ([192.94.38.131])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Tom_Rini@mentor.com>) id 1Pv9h5-0002WS-Dm
	for openembedded-devel@lists.openembedded.org;
	Thu, 03 Mar 2011 15:39:55 +0100
Received: from svr-orw-exc-10.mgc.mentorg.com ([147.34.98.58])
	by relay1.mentorg.com with esmtp 
	id 1Pv9fd-0000ln-LJ from Tom_Rini@mentor.com ;
	Thu, 03 Mar 2011 06:38:25 -0800
Received: from SVR-ORW-FEM-05.mgc.mentorg.com ([147.34.97.43]) by
	SVR-ORW-EXC-10.mgc.mentorg.com with Microsoft
	SMTPSVC(6.0.3790.4675); Thu, 3 Mar 2011 06:38:24 -0800
Received: from [172.30.80.189] (147.34.91.1) by svr-orw-fem-05 (147.34.97.43)
	with Microsoft SMTP Server id 14.1.270.1;
	Thu, 3 Mar 2011 06:38:25 -0800
Message-ID: <4D6FA7CC.9020407@mentor.com>
Date: Thu, 3 Mar 2011 07:38:04 -0700
From: Tom Rini <tom_rini@mentor.com>
Organization: Mentor Graphics Corporation
User-Agent: Mozilla/5.0 (X11; U; Linux i686; en-US;
	rv:1.9.2.13) Gecko/20101208 Lightning/1.0b2 Thunderbird/3.1.7
MIME-Version: 1.0
To: <openembedded-devel@lists.openembedded.org>, Richard Purdie
	<richard.purdie@linuxfoundation.org>
References: <20110224164519.GA12581@jama.jama.net>	<1298647636-13022-1-git-send-email-Martin.Jansa@gmail.com>
	<20110303072744.GB419@jama.jama.net>
In-Reply-To: <20110303072744.GB419@jama.jama.net>
X-OriginalArrivalTime: 03 Mar 2011 14:38:24.0809 (UTC)
	FILETIME=[A6EB2190:01CBD9B0]
Subject: Re: [PATCH] bitbake.conf: define shared PERSISTENT_DIR and point it outside TMPDIR
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-devel>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 03 Mar 2011 14:39:55 -0000
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: 7bit

On 03/03/2011 12:27 AM, Martin Jansa wrote:
> On Fri, Feb 25, 2011 at 04:27:16PM +0100, Martin Jansa wrote:
>> * import from poky 6a11cf7dfe930461a6660e3b783b546fa2634900
>> * we had CACHE var pointing to machine specific dir since 2006
>>    caf077679022f37ce55d758101f130e4e93bd7b5
>> * current bitbake is looking for cache dir like this:
>>    cachedir = (bb.data.getVar("PERSISTENT_DIR", d, True) or
>>                bb.data.getVar("CACHE", d, True))
>>    which without PERSISTENT_DIR defined picks machine-specific CACHE dir
>>    so LOCALCOUNT numbers in SRCPV keeps rolling with every MACHINE switch
>>    in same builddir :/
>
> ping?
>

I'd like Richards comments here.

>>
>> Signed-off-by: Martin Jansa<Martin.Jansa@gmail.com>
>> ---
>>   classes/sanity.bbclass |   12 ++++++++++++
>>   conf/bitbake.conf      |    2 ++
>>   conf/sanity.conf       |    1 +
>>   3 files changed, 15 insertions(+), 0 deletions(-)
>>
>> diff --git a/classes/sanity.bbclass b/classes/sanity.bbclass
>> index 1e6b170..ffe3a49 100644
>> --- a/classes/sanity.bbclass
>> +++ b/classes/sanity.bbclass
>> @@ -189,6 +189,18 @@ def check_sanity(e):
>>   	if messages != "":
>>   		raise_sanity_error(messages)
>>
>> +	#
>> +	# Check there isn't old persistent cache
>> +	#
>> +	cache = data.getVar('CACHE', e.data, True)
>> +	persistent_dir = data.getVar('PERSISTENT_DIR', e.data, True)
>> +	persistent_cache_filename = data.getVar('SANITY_PERSIST_DATA_FILE', e.data, True)
>> +	if os.path.exists(cache + '/' + persistent_cache_filename):
>> +		messages = messages + "Error, persistent cache file '%s' exists in old location '%s', please migrate it to new location '%s' and merge them together if you have one for each MACHINE.\n" % (persistent_cache_filename, cache, persistent_dir)
>> +
>> +	if messages != "":
>> +		raise_sanity_error(messages)
>> +
>>   python check_sanity_eventhandler() {
>>       if isinstance(e, bb.event.BuildStarted):
>>           check_sanity(e)
>> diff --git a/conf/bitbake.conf b/conf/bitbake.conf
>> index 88ad2ba..0c11cdb 100644
>> --- a/conf/bitbake.conf
>> +++ b/conf/bitbake.conf
>> @@ -294,6 +294,8 @@ FILESDIR = "${@bb.which(d.getVar('FILESPATH', 1), '.')}"
>>
>>   TMPDIR = "${TOPDIR}/tmp"
>>   CACHE = "${TMPDIR}/cache${@['', '/' + str(bb.data.getVar('MACHINE', d, 1))][bool(bb.data.getVar('MACHINE', d, 1))]}"
>> +# The persistent cache should be shared by all builds
>> +PERSISTENT_DIR = "${TOPDIR}/conf/persistent"
>>   CO_DIR = "${DL_DIR}"
>>   CVSDIR = "${CO_DIR}/cvs"
>>   SVNDIR = "${CO_DIR}/svn"
>> diff --git a/conf/sanity.conf b/conf/sanity.conf
>> index e9902f6..c1ac332 100644
>> --- a/conf/sanity.conf
>> +++ b/conf/sanity.conf
>> @@ -7,5 +7,6 @@ BB_MIN_VERSION = "1.10.2"
>>
>>   SANITY_ABIFILE = "${TMPDIR}/abi_version"
>>   SANITY_PRFILE = "${TMPDIR}/distro_pr"
>> +SANITY_PERSIST_DATA_FILE = "bb_persist_data.sqlite3"
>>
>>   INHERIT += "sanity"
>> --
>> 1.7.4.1
>>
>
>
>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel


-- 
Tom Rini
Mentor Graphics Corporation


