Received: from relay1.mentorg.com ([192.94.38.131])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Tom_Rini@mentor.com>) id 1Po1Si-0004TW-54
	for openembedded-devel@lists.openembedded.org;
	Fri, 11 Feb 2011 23:27:36 +0100
Received: from svr-orw-exc-10.mgc.mentorg.com ([147.34.98.58])
	by relay1.mentorg.com with esmtp 
	id 1Po1Rc-0003lZ-Ah from Tom_Rini@mentor.com 
	for openembedded-devel@lists.openembedded.org;
	Fri, 11 Feb 2011 14:26:28 -0800
Received: from na2-mail.mgc.mentorg.com ([134.86.114.213]) by
	SVR-ORW-EXC-10.mgc.mentorg.com with Microsoft
	SMTPSVC(6.0.3790.4675); Fri, 11 Feb 2011 14:26:27 -0800
Received: from [172.30.80.144] ([172.30.80.144]) by na2-mail.mgc.mentorg.com
	with Microsoft SMTPSVC(6.0.3790.3959); 
	Fri, 11 Feb 2011 15:26:27 -0700
Message-ID: <4D55B78C.2030203@mentor.com>
Date: Fri, 11 Feb 2011 15:26:20 -0700
From: Tom Rini <tom_rini@mentor.com>
Organization: Mentor Graphics Corporation
User-Agent: Mozilla/5.0 (X11; U; Linux i686; en-US;
	rv:1.9.2.13) Gecko/20101208 Lightning/1.0b2 Thunderbird/3.1.7
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <1296688442-22207-1-git-send-email-schnitzeltony@gmx.de>
	<201102102318.26832.schnitzeltony@gmx.de>
In-Reply-To: <201102102318.26832.schnitzeltony@gmx.de>
X-OriginalArrivalTime: 11 Feb 2011 22:26:27.0349 (UTC)
	FILETIME=[B927AC50:01CBCA3A]
Subject: Re: [PATCH] clutter-gst add 1.3.4
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
X-List-Received-Date: Fri, 11 Feb 2011 22:27:36 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 02/10/2011 03:18 PM, Andreas Mueller wrote:
> On Thursday 03 February 2011 00:14:02 Andreas Mueller wrote:
>> * clutter 1.4.2 broke clutter-gst and made it necessary to have a recipe from
>> * development snapshot sources
>> *
>> * Build tested with
>> * BB_VERSION        = "1.10.2"
>> * METADATA_BRANCH   = "master"
>> * METADATA_REVISION = "2049a96"
>> * TARGET_ARCH       = "arm"
>> * TARGET_OS         = "linux-gnueabi"
>> * MACHINE           = "overo"
>> * DISTRO            = "angstrom"
>> * DISTRO_VERSION    = "2010.7-test-20110202"
>> * TARGET_FPU        = "hard"
>>
>> Signed-off-by: Andreas Mueller<schnitzeltony@gmx.de>
>> ---
>>   recipes/clutter/clutter-gst_1.3.4.bb |    9 +++++++++
>>   1 files changed, 9 insertions(+), 0 deletions(-)
>>   create mode 100644 recipes/clutter/clutter-gst_1.3.4.bb
>>
>> diff --git a/recipes/clutter/clutter-gst_1.3.4.bb b/recipes/clutter/clutter-gst_1.3.4.bb
>> new file mode 100644
>> index 0000000..426cae2
>> --- /dev/null
>> +++ b/recipes/clutter/clutter-gst_1.3.4.bb
>> @@ -0,0 +1,9 @@
>> +require clutter-gst.inc
>> +
>> +PR = "${INC_PR}.0"
>> +
>> +SRC_URI = "http://source.clutter-project.org/sources/clutter-gst/1.3/clutter-gst-${PV}.tar.bz2 \
>> +          "
>> +
>> +SRC_URI[md5sum] = "4f74f78df215cba54444dd6256a29bd4"
>> +SRC_URI[sha256sum] = "de4ce6d3313be3074c6afc6f20276ef06f1a460b3a6755fc5c6e048685de137a"
>>
>
> ping

Applied, thanks for your patience.

-- 
Tom Rini
Mentor Graphics Corporation


