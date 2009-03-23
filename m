Received: from [209.85.198.241] (helo=rv-out-0708.google.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <donari75@gmail.com>) id 1LlfQX-0006hT-87
	for openembedded-devel@lists.openembedded.org;
	Mon, 23 Mar 2009 09:22:33 +0100
Received: by rv-out-0708.google.com with SMTP id k29so1615106rvb.12
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 23 Mar 2009 01:21:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:message-id:date:from
	:user-agent:mime-version:to:subject:content-type
	:content-transfer-encoding;
	bh=72fOtzkIUd8dC5ogC5c/OwZRhj3/Lj4mhMD8o6SGcgo=;
	b=cXOpQRqMHKs8TIVhklssaSwngBXgvBhiom47AwvLzwGdRNnF2Lh4I88ptX8eVVB4xT
	LWE0o3Aj/gwRCY6L9Y58YtRBYpMfVHp+9VZ1UvGLzBB43Iqy8xt0QGs5K/Nm6HPfzS18
	gSUiUnrPNwdRIJtTvP8mQf6F8kc/o0utYTh1A=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=message-id:date:from:user-agent:mime-version:to:subject
	:content-type:content-transfer-encoding;
	b=waMicqi07FoCT8OVd8xq9gU67lPlqqfEsuw4vrHbzzBCpsu9A4ZZP/fhpYGBgA4guY
	E2N+5hoe2TnhC3YuWWhFDSMnEfz1a1AQ7cgHKF7WzlXbSJRPC/qbApIHa4GNqwfKSQ+a
	OggIr5o+fLPUsRpybTcDmG5rJs3tEPcJATjRg=
Received: by 10.141.36.10 with SMTP id o10mr2149456rvj.237.1237796471859;
	Mon, 23 Mar 2009 01:21:11 -0700 (PDT)
Received: from ?192.168.10.240? ([220.88.14.55])
	by mx.google.com with ESMTPS id g22sm9802434rvb.53.2009.03.23.01.21.10
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Mon, 23 Mar 2009 01:21:11 -0700 (PDT)
Message-ID: <49C74642.80105@gmail.com>
Date: Mon, 23 Mar 2009 17:20:18 +0900
From: unsik Kim <donari75@gmail.com>
User-Agent: Thunderbird 2.0.0.21 (X11/20090320)
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
Subject: udevd receives SIGILL
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
X-List-Received-Date: Mon, 23 Mar 2009 08:22:33 -0000
Content-Type: text/plain; charset=EUC-KR
Content-Transfer-Encoding: 7bit

Hello?

Recently I started to change development platform poky to oe, but I have some troubles.

machine : custom PXA270 board.
kernel : custom 2.6.29-rc8
oe git : 49c1a7699ac24c580449c13bc3dba425f1d2bb48 (almost current)
image : base-image (use as NFS-root)

udevd receives SIGILL signal.

I found current oe and poky use same source code for udev package (differences are scripts and build env.)
Here's some tries I did.
If I use udev package from poky in oe's base-image, boot well.
If I provide /etc/dev.tar and using oe's udev package also boot well.
If I change nothing(same as first boot), udevd receive SIGILL.

followings are gdb debug results:

Program received signal SIGILL, Illegal instruction.
0x00009a98 in sig_handler (signum=17) at udevd.c:818
818		write(signal_pipe[WRITE_END], "", 1);
(gdb) l 818
813				reload_config = 1;
814				break;
815		}
816	
817		/* write to pipe, which will wakeup select() in our mainloop */
818		write(signal_pipe[WRITE_END], "", 1);
819	}
820	
821	static void udev_done(int pid, int exitstatus)
822	{

and, debug output message (I use --debug --debug-trace option)
[555] get_ctrl_msg: udevd message (ENV) received, set 'STARTUP=1'
[555] msg_queue_insert: seq 372 queued, 'add' 'bus'
[565] pass_env_to_socket: passed -1 bytes to socket '@/org/kernel/udev/monitor',
[565] pass_env_to_socket: passed -1 bytes to socket '/org/kernel/udev/monitor',
[565] udev_event_run: seq 372 finished with 0

-- 
Regards,
unsik Kim


