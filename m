Received: from relay1.mentorg.com ([192.94.38.131])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Tom_Rini@mentor.com>) id 1QER8i-0004fg-6j
	for openembedded-devel@lists.openembedded.org;
	Mon, 25 Apr 2011 21:08:08 +0200
Received: from svr-orw-fem-01.mgc.mentorg.com ([147.34.98.93])
	by relay1.mentorg.com with esmtp 
	id 1QER6K-0000Dk-R2 from Tom_Rini@mentor.com 
	for openembedded-devel@lists.openembedded.org;
	Mon, 25 Apr 2011 12:05:40 -0700
Received: from SVR-ORW-FEM-05.mgc.mentorg.com ([147.34.97.43]) by
	svr-orw-fem-01.mgc.mentorg.com over TLS secured channel with
	Microsoft SMTPSVC(6.0.3790.4675); Mon, 25 Apr 2011 12:05:40 -0700
Received: from [172.30.80.238] (147.34.91.1) by svr-orw-fem-05 (147.34.97.43)
	with Microsoft SMTP Server id 14.1.270.1;
	Mon, 25 Apr 2011 12:05:40 -0700
Message-ID: <4DB5C602.60703@mentor.com>
Date: Mon, 25 Apr 2011 12:05:38 -0700
From: Tom Rini <tom_rini@mentor.com>
Organization: Mentor Graphics Corporation
User-Agent: Mozilla/5.0 (X11; U; Linux i686; en-US;
	rv:1.9.2.14) Gecko/20110223 Lightning/1.0b2 Thunderbird/3.1.8
MIME-Version: 1.0
To: <openembedded-devel@lists.openembedded.org>
References: <1303756273-22385-1-git-send-email-tom_rini@mentor.com>	<1303756273-22385-4-git-send-email-tom_rini@mentor.com>
	<1303757678.15311.113.camel@mattotaupa>
In-Reply-To: <1303757678.15311.113.camel@mattotaupa>
X-Enigmail-Version: 1.1.1
X-OriginalArrivalTime: 25 Apr 2011 19:05:40.0656 (UTC)
	FILETIME=[C4EBF300:01CC037B]
Subject: Re: [PATCH 3/3] bluez4: Add 4.91 and make it default for Angstrom
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
X-List-Received-Date: Mon, 25 Apr 2011 19:08:08 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

On 04/25/2011 11:54 AM, Paul Menzel wrote:
> Dear Tom,
> 
> 
> On Mo, 2011-04-25 at 11:31 -0700, Tom Rini wrote:
> 
> what build configuration did you use for build testing? Could you add
> that to the commit message please.

Done.

>> Signed-off-by: Tom Rini <tom_rini@mentor.com>
>> ---
>>  recipes/bluez/bluez4_4.91.bb |   18 ++++++++++++++++++
>>  1 files changed, 18 insertions(+), 0 deletions(-)
>>  create mode 100644 recipes/bluez/bluez4_4.91.bb
>>
>> diff --git a/recipes/bluez/bluez4_4.91.bb b/recipes/bluez/bluez4_4.91.bb
>> new file mode 100644
>> index 0000000..16f06d5
>> --- /dev/null
>> +++ b/recipes/bluez/bluez4_4.91.bb
>> @@ -0,0 +1,18 @@
>> +require bluez4.inc
>> +
>> +SRC_URI[md5sum] = "3059b7ef5168c84cd0c6a67034ce79f9"
>> +SRC_URI[sha256sum] = "11e9279e2669db996afd464b96d2c68f41f157f6eb9b8842a0bbcad8a4eac18d"
>> +
>> +DEFAULT_PREFERENCE = "-1"
>> +DEFAULT_PREFERENCE_angstrom = "1"
>> +
>> +DEPENDS += "libsndfile1"
>> +
>> +PR = "${INC_PR}.0"
>> +
>> +# Not all distros have a recent enough udev
>> +BTUDEV = " --disable-udevrules"
>> +BTUDEV_angstrom = " --enable-udevrules"
>> +BTUDEV_shr = " --enable-udevrules"
>> +
>> +EXTRA_OECONF += "${BTUDEV}"
> 
> Please create the patch next time adding `-M -C -C` to `git
> format-patch`.

Is there a way to shove that into ~/.gitconfig?  Otherwise I'm sure to
forget.

> Additionally adding the recipe and making it default for
> Ȧngström could have been two commits in my opinion.

That's a little excessive I think, just because it's largely a given
that Angstrom (and SHR) will be opting to use this and it doesn't add
anything to the bisect'ability of the tree.

> Acked-by: Paul Menzel <paulepanter@users.sourceforge.net>

Just for this one patch I assume.

-- 
Tom Rini
Mentor Graphics Corporation


