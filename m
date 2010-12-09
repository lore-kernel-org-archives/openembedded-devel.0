Received: from qmta08.emeryville.ca.mail.comcast.net ([76.96.30.80])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <enelson1000@comcast.net>) id 1PQlqH-0004Np-HH
	for openembedded-devel@lists.openembedded.org;
	Thu, 09 Dec 2010 20:07:51 +0100
Received: from omta20.emeryville.ca.mail.comcast.net ([76.96.30.87])
	by qmta08.emeryville.ca.mail.comcast.net with comcast
	id h4jb1f0051smiN4A876H5e; Thu, 09 Dec 2010 19:06:17 +0000
Received: from [192.168.1.101] ([71.202.66.210])
	by omta20.emeryville.ca.mail.comcast.net with comcast
	id h76G1f0034YBSof8g76Gdl; Thu, 09 Dec 2010 19:06:16 +0000
Message-ID: <4D0128A5.7010806@comcast.net>
Date: Thu, 09 Dec 2010 11:06:13 -0800
From: Ed Nelson <enelson1000@comcast.net>
User-Agent: Mozilla/5.0 (Windows; U; Windows NT 6.1; en-US;
	rv:1.9.2.12) Gecko/20101027 Lightning/1.0b2 Thunderbird/3.1.6
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <4D0122D7.7030402@comcast.net>
In-Reply-To: <4D0122D7.7030402@comcast.net>
X-SA-Exim-Connect-IP: 76.96.30.80
X-SA-Exim-Mail-From: enelson1000@comcast.net
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: Release-2010.12 build failure - unifdef-native-2.4-0 do_fetch Failed
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
X-List-Received-Date: Thu, 09 Dec 2010 19:07:51 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 12/9/2010 10:41 AM, Ed Nelson wrote:
> I don't think this is a problem with the release but do_fetch 
> complains that the check sum is incorrect.
>
> ========================================================================================================== 
>
> NOTE: fetch http://dotat.at/prog/unifdef/unifdef-2.4.tar.gz
> 200 OK
> Length: 440320 (430K) [application/x-tar]
> Saving to: `/home/ed/oe/oe-release-2010.12/sources/unifdef-2.4.tar.gz'
>
>      0K .......... .......... .......... .......... .......... 11% 
> 85.8M 0s
>     50K .......... .......... .......... .......... .......... 23%  
> 118M 0s
>    100K .......... .......... .......... .......... .......... 34%  
> 202M 0s
>    150K .......... .......... .......... .......... .......... 46%  
> 138M 0s
>    200K .......... .......... .......... .......... .......... 58% 
> 85.2M 0s
>    250K .......... .......... .......... .......... .......... 69% 
> 98.7M 0s
>    300K .......... .......... .......... .......... .......... 81%  
> 141M 0s
>    350K .......... .......... .......... .......... .......... 93% 
> 20.0M 0s
>    400K .......... .......... ..........                      100% 
> 30.1M=0.006s
>
> 2010-12-09 10:15:23 (65.5 MB/s) - 
> `/home/ed/oe/oe-release-2010.12/sources/unifdef-2.4.tar.gz' saved 
> [440320/440320]
>
> FATAL: unifdef-native-2.4: 
> http://dotat.at/prog/unifdef/unifdef-2.4.tar.gz cannot check archive 
> integrity
> ERROR: Error in executing python function in: 
> /home/ed/oe/oe-release-2010.12/openembedded/recipes/unifdef/unifdef_2.4.bb
> ERROR: Exception:<type 'exceptions.SystemExit'> Message:1
> ERROR: Printing the environment of the function
> ERROR: Function base_do_fetch failed
> ERROR: TaskFailed event exception, aborting
> ERROR: Build of 
> virtual:native:/home/ed/oe/oe-release-2010.12/openembedded/recipes/unifdef/unifdef_2.4.bb 
> do_fetch failed
> ERROR: Task 1334 
> (virtual:native:/home/ed/oe/oe-release-2010.12/openembedded/recipes/unifdef/unifdef_2.4.bb, 
> do_fetch) failed with 256
> ERROR: 
> 'virtual:native:/home/ed/oe/oe-release-2010.12/openembedded/recipes/unifdef/unifdef_2.4.bb' 
> failed
> NOTE: The checksums for 
> '/home/ed/oe/oe-release-2010.12/sources/unifdef-2.4.tar.gz' did not 
> match.
> Expected MD5: '9aba8b30187244677f25834cbc11bfe2' and Got: 
> 'dc1f77a04dd49048d71bbba896bff60e'
> Expected SHA256: 
> '52b8b5c411b3d33646b6a7518c37c3a2a308887c45ac58a13122823b02fd4f4a' and 
> Got: '853a234ae4c6f36035d01ad7d97e8b8e548a499c3de6bac6cf275f2a334979ca'
> NOTE: Your checksums:
> SRC_URI[md5sum] = "dc1f77a04dd49048d71bbba896bff60e"
> SRC_URI[sha256sum] = 
> "853a234ae4c6f36035d01ad7d97e8b8e548a499c3de6bac6cf275f2a334979ca"
>
> FATAL: unifdef-native-2.4: 
> http://dotat.at/prog/unifdef/unifdef-2.4.tar.gz cannot check archive 
> integrity
> ERROR: 
> 'virtual:native:/home/ed/oe/oe-release-2010.12/openembedded/recipes/unifdef/unifdef_2.4.bb' 
> faile
>
> ============================================================================================================== 
>
>
>
>
> If I modify the recipe with the checksums that bitbake thinks they 
> should be and then run it again it fails with the following:
>
> =================================================================================================== 
>
> NOTE: package unifdef-native-2.4-0: task do_fetch: Succeeded
> NOTE: Running task 30 of 4003 (ID: 1327, 
> virtual:native:/home/ed/oe/oe-release-2010.12/openembedded/recipes/unifdef/unifdef_2.4.bb, 
> do_unpack)
> FATAL: Unable to unpack 
> '/home/ed/oe/oe-release-2010.12/sources/unifdef-2.4.tar.gz' to 
> '/home/ed/oe/build-at91sam9g20-angstrom/tmp/work/x86_64-linux/unifdef-native-2.4-0' 
> (cmd: tar xz --no-same-owner -f 
> /home/ed/oe/oe-release-2010.12/sources/unifdef-2.4.tar.gz):
> Execution of 'tar xz --no-same-owner -f 
> /home/ed/oe/oe-release-2010.12/sources/unifdef-2.4.tar.gz' failed with 
> exit code 2:
>
> gzip: stdin: not in gzip format
> tar: Child returned status 1
> tar: Exiting with failure status due to previous errors
> ===========================================================
>
>
> So is the source file at 
> http://dotat.at/prog/unifdef/unifdef-2.4.tar.gz corrupted?
> If so were can I download a clean file?
>
> Thanks
> Ed
>
>
>
>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>


Never mind - found another source to download from - sorry about wasting 
everyone's time.

Thanks
Ed


