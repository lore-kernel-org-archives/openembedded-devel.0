Received: from mail-bk0-f47.google.com ([209.85.214.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sledz@dresearch-fe.de>) id 1TEacC-0002VK-CM
	for openembedded-devel@lists.openembedded.org;
	Thu, 20 Sep 2012 08:52:00 +0200
Received: by bkvi18 with SMTP id i18so587972bkv.6
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 19 Sep 2012 23:39:18 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=message-id:date:from:user-agent:mime-version:to:cc:subject
	:x-enigmail-version:content-type:content-transfer-encoding
	:x-gm-message-state;
	bh=F5nqO+1vIKWX4V9Lw987NKR6Y8lYoM5dAGB0euQ/xP8=;
	b=edEV/aa0tQvhto8HZ3dU/WO7zvDF/OihBzZEGVk12q09gPSHQArOPcVRRUx7P1arCf
	0PtM4+SigM931Szc3gVU3c5h6cEegymYVxYzW2/uL2HIba77CyDovq0TIPYtqVQ7IcDu
	/9MVIFsfIFsVmpVoWh09xcy02EMemW2Js5rORAgcsglwYejQRopQPpcdOIimKaYF+Fl1
	+HTw6lgfCcjy3TYlQQPv2H/5ke8UhyM0DcnAKuF98nzgotplaBdT+h/JVwb+HaA0OkzY
	HUvA1sLTI1uMIitqutxObJE2Laq8bZhIBQH+7DljUYFV4LJSWUxU8At1RJNO6t55IvDF
	Cqzg==
Received: by 10.204.133.196 with SMTP id g4mr204923bkt.89.1348123157831;
	Wed, 19 Sep 2012 23:39:17 -0700 (PDT)
Received: from [172.29.23.6] (zk223.dresearch-fe.de. [217.92.177.116])
	by mx.google.com with ESMTPS id d13sm2508364bkw.12.2012.09.19.23.39.16
	(version=SSLv3 cipher=OTHER); Wed, 19 Sep 2012 23:39:17 -0700 (PDT)
Message-ID: <505ABA13.2050109@dresearch-fe.de>
Date: Thu, 20 Sep 2012 08:39:15 +0200
From: Steffen Sledz <sledz@dresearch-fe.de>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:15.0) Gecko/20120825 Thunderbird/15.0
MIME-Version: 1.0
To: openembedded-devel <openembedded-devel@lists.openembedded.org>
X-Enigmail-Version: 1.4.4
X-Gm-Message-State: ALoCoQmrhVJDoiJ1G3QxFU9qnA5gKAZ8Yhnb1RGEXdOG4oLyHy3XN2fwa868dolr7nA4Au4zRz+E
Cc: Robert Schuster <robertschuster@fsfe.org>,
	Henning Heinold <h.heinold@tarent.de>
Subject: Weird build problem with classpath-native/java-initial
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
X-List-Received-Date: Thu, 20 Sep 2012 06:52:00 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

We hit a weird build problem after upgrading from openSUSE 12.1 to 12.2.

We're building oe-classic (2011.03-maintenance). But the problem may be relevant for oe-core/meta-java too.

The first observation was that the do_configure step of classpath-native did not finish.

-------------> bitbake output <----------------
...
NOTE: Running task 7 of 18 (ID: 12, /home/sledz/work/openembedded/recipes/classpath/classpath-native_0.98.bb, do_configure)
NOTE: package classpath-native-0.98-r4: task do_configure: Started
(no more output here)
---------------------------------------------------------------------------------------------

Some investigations later we learned that configure calls a self built java-initial script. This script seams to have a problem.

-------------> config.log <---------------
configure:23774: checking if /home/sledz/work/HydraIP/OE/tmp.6/sysroots/i686-linux/usr/bin/java-initial works
configure:23805: CLASSPATH=.: /home/sledz/work/HydraIP/OE/tmp.6/sysroots/i686-linux/usr/bin/java-initial  Test
/home/sledz/work/HydraIP/OE/tmp.6/sysroots/i686-linux/usr/bin/java-initial: line 14:  9173 Segmentation fault      jamvm-initial ${1+"$@"}
/home/sledz/work/HydraIP/OE/tmp.6/sysroots/i686-linux/usr/bin/java-initial: line 14:  9178 Segmentation fault      jamvm-initial ${1+"$@"}
/home/sledz/work/HydraIP/OE/tmp.6/sysroots/i686-linux/usr/bin/java-initial: line 14:  9183 Segmentation fault      jamvm-initial ${1+"$@"}
/home/sledz/work/HydraIP/OE/tmp.6/sysroots/i686-linux/usr/bin/java-initial: line 14:  9188 Segmentation fault      jamvm-initial ${1+"$@"}
/home/sledz/work/HydraIP/OE/tmp.6/sysroots/i686-linux/usr/bin/java-initial: line 14:  9193 Segmentation fault      jamvm-initial ${1+"$@"}
/home/sledz/work/HydraIP/OE/tmp.6/sysroots/i686-linux/usr/bin/java-initial: line 14:  9198 Segmentation fault      jamvm-initial ${1+"$@"}
...
---------------------------------------------------------------------------------------------

A short look into this script shows the cause for the endless loop.

-------------> /home/sledz/work/HydraIP/OE/tmp.6/sysroots/i686-linux/usr/bin/java-initial  <---------------
#!/bin/sh
#
# Wrapper which (almost) silently restarts the VM in case of segfaults.

redo_from_start=1;
while [ $redo_from_start -eq 1 ]; do
    echo "Running JamVM-initial: ${@}"
    redo_from_start=0;
    jamvm-initial ${1+"$@"}
    if [ $? -eq 139 ]; then
        echo "JamVM-initial crashed - silently trying again"
        redo_from_start=1;
    fi
done
---------------------------------------------------------------------------------------------

I see two problems:

* First the script should not use an endless loop.
* Second the segfault should be fixed.

Any specialists with suggestions handling this?

Regards,
Steffen

BTW: I'm absolutely not a Java specialist.

-- 
DResearch Fahrzeugelektronik GmbH
Otto-Schmirgal-Str. 3, 10319 Berlin, Germany
Tel: +49 30 515932-237 mailto:sledz@dresearch-fe.de
Fax: +49 30 515932-299
Geschäftsführer: Dr. Michael Weber, Werner Mögle;
Amtsgericht Berlin Charlottenburg; HRB 130120 B;
Ust.-IDNr. DE273952058


