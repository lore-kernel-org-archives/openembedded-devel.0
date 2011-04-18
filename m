Received: from exprod5og108.obsmtp.com ([64.18.0.186])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martyn.welch@ge.com>) id 1QBpIt-0002at-C9
	for openembedded-devel@lists.openembedded.org;
	Mon, 18 Apr 2011 16:19:51 +0200
Received: from Cinmlip06.e2k.ad.ge.com ([165.156.4.1]) (using TLSv1) by
	exprod5ob108.postini.com ([64.18.4.12]) with SMTP
	ID DSNKTaxH+q3HZyxejTHWoaSyOkxYeejJ/YUX@postini.com;
	Mon, 18 Apr 2011 07:17:33 PDT
Received: from unknown (HELO cinmlef09.e2k.ad.ge.com) ([3.159.213.56])
	by Cinmlip06.e2k.ad.ge.com with ESMTP; 18 Apr 2011 08:31:09 -0400
Received: from [3.138.54.92] ([3.138.54.92]) by cinmlef09.e2k.ad.ge.com with
	Microsoft SMTPSVC(6.0.3790.4675); Mon, 18 Apr 2011 08:31:09 -0400
Message-ID: <4DAC2F0C.1030001@ge.com>
Date: Mon, 18 Apr 2011 13:31:08 +0100
From: Martyn Welch <martyn.welch@ge.com>
Organization: GE Intelligent Platforms
User-Agent: Mozilla/5.0 (X11; U; Linux i686; en-US;
	rv:1.9.2.14) Gecko/20110223 Thunderbird/3.1.8
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <87zknq5iw3.fsf@gmail.com>
In-Reply-To: <87zknq5iw3.fsf@gmail.com>
X-Enigmail-Version: 1.1.2
X-OriginalArrivalTime: 18 Apr 2011 12:31:09.0930 (UTC)
	FILETIME=[7F2D8CA0:01CBFDC4]
Subject: Re: [oe,RFC,v2] Alternative to busybox, using "proper tools"
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
X-List-Received-Date: Mon, 18 Apr 2011 14:19:51 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit

On 16/04/11 16:13, Ben Gamari wrote:
> 
> Did anything ever happen with this[1] patch? If not, is there another
> convenient way to use the proper tools in leiu of busybox? For larger
> machines it's very nice to have a more civilized environment. Thanks,
> 

I'm afraid I got pulled away from this before I could finish it.

The list of packages in task-proper-tools got updated by Marcin, I still have
a rather old tree containing the rest of it. Here's what I have (sorry my mail
client will have wrapped it a bit):

diff --git a/recipes/busybox/busybox-alt_1.bb b/recipes/busybox/busybox-alt_1.bb
new file mode 100644
index 0000000..811f073
--- /dev/null
+++ b/recipes/busybox/busybox-alt_1.bb
@@ -0,0 +1,19 @@
+DESCRIPTION = "Full versions of tools provided by busybox"
+
+PACKAGES = "busybox"
+PACKAGE_ARCH = "all"
+
+PROVIDES = "busybox"
+DEFAULT_PREFERENCE = "-1"
+
+RDEPENDS = "task-proper-tools"
+
+SRC_URI = "file://hwclock.sh"
+
+
+do_install () {
+       install -d ${D}${sysconfdir}/init.d/
+       install -m 0755 ${WORKDIR}/hwclock.sh ${D}${sysconfdir}/init.d/
+}
+
+FILES += "${sysconfdir}/init.d/hwclock.sh"
diff --git a/recipes/busybox/files/hwclock.sh b/recipes/busybox/files/hwclock.sh
index f9c9f9f..0a644fe 100644
--- a/recipes/busybox/files/hwclock.sh
+++ b/recipes/busybox/files/hwclock.sh
@@ -14,7 +14,7 @@

 . /etc/default/rcS

-[ "$UTC" = yes ] && UTC=-u || UTC=-l
+[ "$UTC" = yes ] && UTC=--utc || UTC=--localtime

 case "$1" in
         start)
diff --git a/recipes/tasks/task-proper-tools.bb
b/recipes/tasks/task-proper-tools.bb
index 40baf87..fd5e481 100644
--- a/recipes/tasks/task-proper-tools.bb
+++ b/recipes/tasks/task-proper-tools.bb
@@ -21,6 +21,7 @@ RDEPENDS_${PN} = "\
                grep \
                gzip \
                ifupdown \
+#              inetutils \
                iproute2 \
                iputils-arping \
                iputils-ping6 \
@@ -40,6 +41,7 @@ RDEPENDS_${PN} = "\
                psmisc \
                pump \
                realpath \
+               openrdate \
                sed \
                shadow \
                start-stop-daemon \
@@ -51,6 +53,7 @@ RDEPENDS_${PN} = "\
                time \
                unzip \
                util-linux-ng \
+               unzip \
                vim \
                wget \
         "


-- 
Martyn Welch (Principal Software Engineer) | Registered in England and
GE Intelligent Platforms                   | Wales (3828642) at 100
T +44(0)127322748                          | Barbirolli Square, Manchester,
E martyn.welch@ge.com                      | M2 3AB  VAT:GB 927559189


