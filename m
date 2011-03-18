Received: from mail-qy0-f182.google.com ([209.85.216.182])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <tarjei.knapstad@gmail.com>) id 1Q0V99-0008Ux-J7
	for openembedded-devel@lists.openembedded.org;
	Fri, 18 Mar 2011 09:35:00 +0100
Received: by qyk27 with SMTP id 27so3232003qyk.6
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 18 Mar 2011 01:33:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:date:message-id:subject:from:to
	:content-type; bh=1Wj7ItbZdqf3v2RxdQpgCi3DJhkZPcdm+yQFWhOapRk=;
	b=WXjY4VlxadJDhj2oczWjNZRjNfxg4tW3dfPQR33hJaS2EmeeU8fO+pwF4ja9I1wqkV
	dNgTB28ws+/5Fr8LmcRMtCdxnZ2EbuqW5FxxFEGrbsmt0dvkJEsfesibavae3XhGvcWZ
	+cqRYTb2EacIzKaKHjx0ggeLe2nyxXKYEYKoY=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:date:message-id:subject:from:to:content-type;
	b=M4a8a/m96MmUPQRZDh6GKQC1Zz/HV/HFVjCZF0xSN6XdmxQfJ1bSxtmvJhRNLJE3X7
	zIBhCiDSckK81nNU2CBUWTGFhhB1ROsDLiUHtqZlw7WSxvHWdmZe0P56ETr+x2zHlrIZ
	rWBhIMB4/8bOFwOBI5n15Q95OIomeZAq4n8wg=
MIME-Version: 1.0
Received: by 10.229.51.74 with SMTP id c10mr624604qcg.248.1300437193923; Fri,
	18 Mar 2011 01:33:13 -0700 (PDT)
Received: by 10.229.192.66 with HTTP; Fri, 18 Mar 2011 01:33:13 -0700 (PDT)
Date: Fri, 18 Mar 2011 09:33:13 +0100
Message-ID: <AANLkTik0yYB28d951apBxi9R0uVHHGFPcijtrjxsNpu6@mail.gmail.com>
From: Tarjei Knapstad <tarjei.knapstad@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: Triggering kgdb on linux-2.6.37 with ttyOx
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
X-List-Received-Date: Fri, 18 Mar 2011 08:35:00 -0000
Content-Type: text/plain; charset=ISO-8859-1

In recent kernels the omap serial consoles have been renamed from
ttySx to ttyOx. This seems to be an issue for kgdb. Setting kernel
boot parameters has no effect:

kgdb=ttyO2,115200n8 kgdboc=ttyO2,115200n8 kgdbwait

and attempting to trigger kgdb from the console also fails:

# echo ttyO2 > /sys/module/kgdboc/parameters/kgdboc
-bash: echo: write error: No such device

Attempting to send 'g' to sysrequest also does nothing, not sure if
there has been changes to the magic sysrq stuff as well?
# echo g > /proc/sysrq-trigger
[  120.267944] SysRq : HELP : loglevel(0-9) reBoot Crash
terminate-all-tasks(E) memory-full-oom-kill(F) kill-all-tasks(I) t
haw-filesystems(J) saK show-memory-usage(M) nice-all-RT-tasks(N)
powerOff show-registers(P) show-all-timers(Q) unRaw Sync s
how-task-states(T) Unmount show-blocked-tasks(W)

I've had a look at the kgdb code, but I can't figure out what to patch
to make it understand that ttyO2 is a valid terminal. Any suggestions?

Thanks,
Tarjei


