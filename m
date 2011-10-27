Received: from mail-qy0-f175.google.com ([209.85.216.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <itodroid@gmail.com>) id 1RJS1W-0004Oo-PB
	for openembedded-devel@lists.openembedded.org;
	Thu, 27 Oct 2011 17:37:42 +0200
Received: by qyk35 with SMTP id 35so1001345qyk.6
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 27 Oct 2011 08:31:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=from:to:references:in-reply-to:subject:date:message-id:mime-version
	:content-type:content-transfer-encoding:x-mailer:thread-index
	:content-language;
	bh=sd5a0ZqMYV0ZKnGNSBBl2QhbVTNPLJ2HmYUSmqeCOvM=;
	b=RUdhRajsNo8f99Q/snjQABb+XShYJcmgxUUPSmxmc6YYqE6enOhmUXnQ9PbgkHrMMH
	kWVnytvry+M+rap/wguAGaNGQIS0nJj7VgbAr2cGIT0X+4tMVtMkx6rcISE0ZvtlCCoI
	0HaVdBsz3Df7g8ixhFqDUcCLRY4yeakj5K+h0=
Received: by 10.68.7.166 with SMTP id k6mr75607209pba.128.1319729500683;
	Thu, 27 Oct 2011 08:31:40 -0700 (PDT)
Received: from AZPCMATTWALTER (wsip-174-78-94-230.ph.ph.cox.net.
	[174.78.94.230])
	by mx.google.com with ESMTPS id 4sm15488916pbj.18.2011.10.27.08.31.38
	(version=TLSv1/SSLv3 cipher=OTHER);
	Thu, 27 Oct 2011 08:31:39 -0700 (PDT)
From: "itodroid" <itodroid@gmail.com>
To: <openembedded-devel@lists.openembedded.org>
References: <01b901cc934b$a5a00620$f0e01260$@gmail.com>
	<4EA7BF81.108@nedap.com>
In-Reply-To: <4EA7BF81.108@nedap.com>
Date: Thu, 27 Oct 2011 08:31:36 -0700
Message-ID: <030501cc94bd$85273210$8f759630$@gmail.com>
MIME-Version: 1.0
X-Mailer: Microsoft Outlook 14.0
Thread-Index: AQH+WKLBTXSjJR33C8Dbn86nykFV/QIGU/rwlRyWfxA=
Subject: Re: Creating an ejre receipe
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
X-List-Received-Date: Thu, 27 Oct 2011 15:37:43 -0000
Content-Type: text/plain;
	charset="us-ascii"
Content-Transfer-Encoding: 7bit
Content-Language: en-us

Thanks to Phil Blundell and Jaap de Jeong for helping out with my ejre
recipe.  It was indeed the ${D} in my FILES_${PN} variable.

-----Original Message-----
From: openembedded-devel-bounces@lists.openembedded.org
[mailto:openembedded-devel-bounces@lists.openembedded.org] On Behalf Of Jaap
de Jong
Sent: Wednesday, October 26, 2011 1:06 AM
To: openembedded-devel@lists.openembedded.org
Subject: Re: [oe] Creating an ejre receipe

I added a few lines for mine version

    # no gnu_hash in any file, so skip QA...
    INSANE_SKIP_${PN} = True

    inherit update-alternatives

    ALTERNATIVE_NAME = "java"
    ALTERNATIVE_PATH = "${libdir}/jvm/java-6-sun/jre/bin/java"
    ALTERNATIVE_PRIORITY = "4"



On 10/25/2011 09:23 PM, itodroid wrote:
> Greetings all.  I'm not sure of the frequency of posting to this list, 
> but I thought I would ask all of you a question regarding creating a 
> recipe for Oracle/Sun's embedded JRE.  I can't seem to figure out the 
> syntax needed to create an appropriate recipe for automatically 
> including the ejre in my image.
>
> Everytime I try to bitbake, my deployment packet (ipk) is<  1000 
> bytes.  In other words, I think its empty.  The recipe should simply 
> untar the .tar.gz file and put it into a format that can be 
> distributed into the sysroot (I'm picking /usr/java for its 
> destination).  I'd appreciate any feedback/comments/fixes to the
following:
>
> DESCRIPTION = "Oracle/Sun Embedded JRE"
> PV = "1.6.0"
> PR = "27"
> SRC_URI =
> "file://ejre-1_6_0_27-fcs-b07-linux-arm-vfp-eabi-headless-18_jul_2011.
> tar.gz
> "
>
> S = "${WORKDIR}"
>
> SRC_URI[md5sum]="b30175c5168e1df394bc79474583f2a3"
> SRC_URI[sha256sum]="d8b02bd16c95435d9c460cea060bc10b6eda00a2e8864d6412
> 074903
> dd73243c"
>
> do_compile() {
> }
>
> do_install() {
>    install -d ${D}/usr/java
>    cp -R ${S}/ejre${PV}_${PR}/* ${D}/usr/java }
>
> do_qa_staging() {
> }
>
> do_package_qa() {
> }
>
> FILES_${PN} = " \
>    ${D}/usr/java/* \
> "
>
> PACKAGE = ${PN}
>
>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>
_______________________________________________
Openembedded-devel mailing list
Openembedded-devel@lists.openembedded.org
http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel



