Received: from smtp3.nedap.com ([87.249.123.12] helo=smtp.nedap.com)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <jaap.dejong@nedap.com>) id 1RIyb6-0007Rt-L8
	for openembedded-devel@lists.openembedded.org;
	Wed, 26 Oct 2011 10:12:28 +0200
Received: from nvs0066.nedap.local (10.91.8.1) by relaysmtp1.nedap.local
	(10.1.8.139) with Microsoft SMTP Server id 8.3.83.0; Wed, 26 Oct 2011
	10:06:26 +0200
X-TM-IMSS-Message-ID: <94316bfb000b14c9@nedap.com>
Received: from [10.2.40.10] ([10.2.40.10]) by nedap.com ([10.91.8.1]) with
	ESMTP (TREND IMSS SMTP Service 7.1) id 94316bfb000b14c9 ;
	Wed, 26 Oct 2011 10:02:43 +0200
Message-ID: <4EA7BF81.108@nedap.com>
Date: Wed, 26 Oct 2011 10:06:25 +0200
From: Jaap de Jong <jaap.dejong@nedap.com>
User-Agent: Mozilla/5.0 (X11; U; Linux i686; en-US;
	rv:1.9.2.23) Gecko/20110922 Lightning/1.0b2 Thunderbird/3.1.15
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <01b901cc934b$a5a00620$f0e01260$@gmail.com>
In-Reply-To: <01b901cc934b$a5a00620$f0e01260$@gmail.com>
X-Content-Filtered-By: Mailman/MimeDel 2.1.11
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
X-List-Received-Date: Wed, 26 Oct 2011 08:12:28 -0000
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: 7bit

I added a few lines for mine version

    # no gnu_hash in any file, so skip QA...
    INSANE_SKIP_${PN} = True

    inherit update-alternatives

    ALTERNATIVE_NAME = "java"
    ALTERNATIVE_PATH = "${libdir}/jvm/java-6-sun/jre/bin/java"
    ALTERNATIVE_PRIORITY = "4"



On 10/25/2011 09:23 PM, itodroid wrote:
> Greetings all.  I'm not sure of the frequency of posting to this list, but I
> thought I would ask all of you a question regarding creating a recipe for
> Oracle/Sun's embedded JRE.  I can't seem to figure out the syntax needed to
> create an appropriate recipe for automatically including the ejre in my
> image.
>
> Everytime I try to bitbake, my deployment packet (ipk) is<  1000 bytes.  In
> other words, I think its empty.  The recipe should simply untar the .tar.gz
> file and put it into a format that can be distributed into the sysroot (I'm
> picking /usr/java for its destination).  I'd appreciate any
> feedback/comments/fixes to the following:
>
> DESCRIPTION = "Oracle/Sun Embedded JRE"
> PV = "1.6.0"
> PR = "27"
> SRC_URI =
> "file://ejre-1_6_0_27-fcs-b07-linux-arm-vfp-eabi-headless-18_jul_2011.tar.gz
> "
>
> S = "${WORKDIR}"
>
> SRC_URI[md5sum]="b30175c5168e1df394bc79474583f2a3"
> SRC_URI[sha256sum]="d8b02bd16c95435d9c460cea060bc10b6eda00a2e8864d6412074903
> dd73243c"
>
> do_compile() {
> }
>
> do_install() {
>    install -d ${D}/usr/java
>    cp -R ${S}/ejre${PV}_${PR}/* ${D}/usr/java
> }
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

