Received: from mail-px0-f175.google.com ([209.85.212.175])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <graham.gower@gmail.com>) id 1PFENo-00039p-IJ
	for openembedded-devel@lists.openembedded.org;
	Mon, 08 Nov 2010 00:10:59 +0100
Received: by pxi2 with SMTP id 2so791068pxi.6
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 07 Nov 2010 15:09:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:message-id:date:from
	:user-agent:mime-version:to:subject:content-type
	:content-transfer-encoding;
	bh=U928ZIigBCLjoy19HCNxeJSzWAkCj0ykkrKirlpliRg=;
	b=BHoV1sHYcjBNAwQtDN4yRsLvuSIcudG5RzlThFPwNQ/vE9OynyGogti1f46P3UopbS
	UXQmJO/duWpcOw/qwnvRGvdFCK6WADU+9CWjw8O8oDHb1CWOyMa+BSXZzNLMpKrYmyft
	McJlGs0tlf7bjRzmh7ycBqOBfWjQMVfh/gV9Q=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=message-id:date:from:user-agent:mime-version:to:subject
	:content-type:content-transfer-encoding;
	b=T9d/7/I1OFQ7IIQJx2WtsiHlV84D5elN20XBBQc/ZSFTJT9y6jMBEdVoguXMHQgMSi
	0Vibc4+UjwWU+rOaxL1qM67YnTSJi4INkVXtm+3ze6C/I37VI07CThNoAjx1R3ow2QxF
	oZpn6Flj4m4lbiTZF+F0UIRf8nYgVzGbj1OT4=
Received: by 10.142.114.5 with SMTP id m5mr4172376wfc.237.1289171376680;
	Sun, 07 Nov 2010 15:09:36 -0800 (PST)
Received: from [10.0.0.71] (eth7090.sa.adsl.internode.on.net [150.101.58.177])
	by mx.google.com with ESMTPS id w42sm7038688wfh.3.2010.11.07.15.09.33
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Sun, 07 Nov 2010 15:09:35 -0800 (PST)
Message-ID: <4CD731A8.3020809@gmail.com>
Date: Mon, 08 Nov 2010 09:39:28 +1030
From: Graham Gower <graham.gower@gmail.com>
User-Agent: Mozilla/5.0 (X11; U; Linux x86_64; en-US;
	rv:1.9.1.14) Gecko/20101020 Thunderbird/3.0.9
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.212.175
X-SA-Exim-Mail-From: graham.gower@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: bitbake weirdness during -k world
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
X-List-Received-Date: Sun, 07 Nov 2010 23:11:02 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit

I have a 1gb world.log file after running:
bitbake -k world | tee world.log

The build appears to have gotten about half way through (compared with
previous builds) and then begun infinitely repeating the following message.

Traceback (most recent call last):
  File "/home/grg/oe2/bitbake/lib/bb/server/none.py", line 128, in idle_commands
    retval = function(self, data, False)
  File "/home/grg/oe2/bitbake/lib/bb/cooker.py", line 716, in buildTargetsIdle
    retval = rq.execute_runqueue()
  File "/home/grg/oe2/bitbake/lib/bb/runqueue.py", line 877, in execute_runqueue
    self.execute_runqueue_internal()
  File "/home/grg/oe2/bitbake/lib/bb/runqueue.py", line 992, in execute_runqueue_internal
    self.build_pipes[pipe].read()
  File "/home/grg/oe2/bitbake/lib/bb/runqueue.py", line 1227, in read
    bb.event.fire_from_worker(self.queue[:index+8], self.d)
  File "/home/grg/oe2/bitbake/lib/bb/event.py", line 137, in fire_from_worker
    event = pickle.loads(event[7:-8])
  File "/usr/lib64/python2.6/pickle.py", line 1374, in loads
    return Unpickler(file).load()
  File "/usr/lib64/python2.6/pickle.py", line 858, in load
    dispatch[key](self)
  File "/usr/lib64/python2.6/pickle.py", line 966, in load_string
    raise ValueError, "insecure string pickle"
ValueError: insecure string pickle


I identified the location where the message begins and it is not possible
to link it to any other errors nor to a particular recipe. Context looks like this:

NOTE: Unpacking ../oe/sources/libAppleWM-1.4.0.tar.bz2 to /mnt/oe/tmp/work/mipsel-oe-linux/libapplewm-1_1.4.0-r9.0/
NOTE: package dhcpcd-1.3.22-pl4-r1: task do_install: Succeeded
NOTE:   /usr/share/ti/ti-biosutils-tree/packages/xdoc/external.png
NOTE:   /usr/share/ti/ti-biosutils-tree/packages/xdoc/Bullet.png
Traceback (most recent call last):
  File "/home/grg/oe2/bitbake/lib/bb/server/none.py", line 128, in idle_commands
    retval = function(self, data, False)
  File "/home/grg/oe2/bitbake/lib/bb/cooker.py", line 716, in buildTargetsIdle
    retval = rq.execute_runqueue()



FYI, i do have this stupidity in my local.conf:
PARALLEL_MAKE = "-j 12"
BB_NUMBER_THREADS = "12"


-Graham


