Received: from relay1.mentorg.com ([192.94.38.131])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <Tom_Rini@mentor.com>) id 1OOi5s-0003fI-49
	for openembedded-devel@lists.openembedded.org;
	Wed, 16 Jun 2010 04:11:09 +0200
Received: from svr-orw-exc-08.mgc.mentorg.com ([147.34.98.97])
	by relay1.mentorg.com with esmtp 
	id 1OOi1W-0002t7-98 from Tom_Rini@mentor.com 
	for openembedded-devel@lists.openembedded.org;
	Tue, 15 Jun 2010 19:06:38 -0700
Received: from na2-mail.mgc.mentorg.com ([134.86.114.213]) by
	SVR-ORW-EXC-08.mgc.mentorg.com with Microsoft
	SMTPSVC(6.0.3790.1830); Tue, 15 Jun 2010 19:06:37 -0700
Received: from [172.30.80.129] ([172.30.80.129]) by na2-mail.mgc.mentorg.com
	with Microsoft SMTPSVC(6.0.3790.3959); 
	Tue, 15 Jun 2010 20:06:36 -0600
Message-ID: <4C1831AA.1030005@mentor.com>
Date: Tue, 15 Jun 2010 19:06:34 -0700
From: Tom Rini <tom_rini@mentor.com>
Organization: Mentor Graphics Corporation
User-Agent: Thunderbird 2.0.0.24 (X11/20100411)
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <4C0D498A.4030709@mentor.com>	<4C17BCF4.30109@mentor.com>
	<AANLkTinZ-EFiDW6IK-bRPh9JElAbnwaET56jGKnwm0cr@mail.gmail.com>
In-Reply-To: <AANLkTinZ-EFiDW6IK-bRPh9JElAbnwaET56jGKnwm0cr@mail.gmail.com>
X-OriginalArrivalTime: 16 Jun 2010 02:06:36.0980 (UTC)
	FILETIME=[8D27A740:01CB0CF8]
X-SA-Exim-Connect-IP: 192.94.38.131
X-SA-Exim-Mail-From: Tom_Rini@mentor.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=BAYES_00 autolearn=ham
	version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: [PATCH, RFC] Add linux-libc-headers-native, make it default 	dep for native
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
X-List-Received-Date: Wed, 16 Jun 2010 02:11:09 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

Leon Woestenberg wrote:
> Hello Tom,
> 
> On Tue, Jun 15, 2010 at 7:48 PM, Tom Rini <tom_rini@mentor.com> wrote:
>> For the second, yes, ASSUME_PROVIDED still works.  For the first, I'd argue
>> that doing so is a lot harder (at least without some additional
>> infrastructure and reliance on other external tools) than just adding
>> another early package.
>>
>> So, yay or nay?
>>
> I would say the ASSUME_PROVIDED for the native linux headers should be
> mentioned in the local.conf.sample,
> commented out, so that users can enable it easily (optimize the build
> like Khem says).
> 
> Could you add that to the patch, or as a follow-up patch?

As a follow-up:
--- a/conf/local.conf.sample
+++ b/conf/local.conf.sample
@@ -30,6 +30,11 @@ BBFILES := "${@bb.fatal('Edit your conf/local.conf: 
BBFILES')}"
  # This is a regulary expression, so be sure to get your parenthesis 
balanced.
  BBMASK = ""

+# Uncomment this if your host distribution has recent enough Linux
+# Kernel header files.  Utilities we use to generate certain types of
+# target filesystems need somewhat recent header files.
+# ASSUME_PROVIDED += "linux-libc-headers-native"
+
  # Uncomment this if you want to use a prebuilt toolchain. You will need to
  # provide packages for toolchain and additional libraries yourself. 
You also
  # have to set PATH in your environment to make sure BitBake finds 
additional binaries.

-- 
Tom Rini
Mentor Graphics Corporation


