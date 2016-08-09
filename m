Return-Path: <ankur.tyagi85@gmail.com>
Received: from mail-qk0-f180.google.com (mail-qk0-f180.google.com
	[209.85.220.180])
	by mail.openembedded.org (Postfix) with ESMTP id 3B65776A51
	for <openembedded-devel@lists.openembedded.org>;
	Tue,  9 Aug 2016 06:59:08 +0000 (UTC)
Received: by mail-qk0-f180.google.com with SMTP id t7so4656104qkh.0
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 08 Aug 2016 23:59:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:from:date:message-id:subject:to;
	bh=g5mK+rRbvCkvsXK70hsYk3A2FS8jodTp8g5GeKFdjgk=;
	b=SpWOqD6vrCNX06DZtMvr/XpOTTCAHuqaJ7eqMiSs2c0oRqo3GU3N/2x7MgRJnoo84/
	nkmJipG5R3rZNqQiCCg+KPOJYFmGbHUIn3GTTTR9KB+QyWFtTOpRdkFMlTmotBjLlQnN
	nEL+jpss7Dfj2+cSV/wRNsXcqkXZf2Kp2AhnSPztZJMPPb7MlRKl0fg6eiGMbJB0kbp1
	G+iyrC6dvEEZvP6IF+UXZa+efT/HC0i15iHr3fq4eaOwir/nd79DL4LLnHZfU8zgzFwr
	S7zhDVW4eaiHGBh1s70gS2jVT4E0QZDw2JRe9IF2Tn7X7J6wkEN2pjwVhbq51h+XkOXp
	Bs9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
	bh=g5mK+rRbvCkvsXK70hsYk3A2FS8jodTp8g5GeKFdjgk=;
	b=CsS3k/7dj5Wm7B86IaTrPzoFwUrLykE69/xfdPGIXAB3lxfxrYJbkDhtV66LVDswuo
	gix+bSwoDysbxjO4HReK5BJ39S5+/hf9aRvhE9YD19ObcbKP2bKMo/pDZe9H/3D5wQhP
	AlQR3l63UgXp6Fs9cuSEbmC7W6lw5VmGt8a7c7Ezlbhy8fjaRK5vKy6l/G36Fd6X9DHC
	Yum6s6q4iNDESw6a82a3MXrTyOjnaUKkWEEp/8j79lemflXHH9FGLuueiMqBxhA7qDSv
	V5qQbQBklSti7Ir8N1uegzth5JyGn+XzU1YLkivTJ2IzXJuLmNKVnq+A+hqtpv3NYFq4
	4HMg==
X-Gm-Message-State: AEkoouu0ya/LjzyidSlincQpw9+i92wME8xfewF3Rw0L/J/LYvcbMecIwNC2VX6m9yasWmjoudKkOn/eRL0ilA==
X-Received: by 10.55.72.2 with SMTP id v2mr4045436qka.68.1470725948731; Mon,
	08 Aug 2016 23:59:08 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.200.47.198 with HTTP; Mon, 8 Aug 2016 23:58:48 -0700 (PDT)
From: Ankur Tyagi <ankur.tyagi85@gmail.com>
Date: Tue, 9 Aug 2016 18:58:48 +1200
Message-ID: <CADySD0Ej3QWux8YV6dAys8q1TYQF9mgCJ9-PciJzKTxMJBQ81Q@mail.gmail.com>
To: openembedded-devel@lists.openembedded.org
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Subject: Splashscreen goes away when login prompt comes on serial console
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 09 Aug 2016 06:59:10 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

Hi,

I have created a custom splash screen using psplash for an embedded device
having touchscreen
=E2=80=8B.=E2=80=8B


But when the boot process is finished and login prompt comes, my screen
goes blank.

My question is how can I make splash screen visible until my application
starts ?

I have modified my /etc/inittab to disable getty on virtual terminal
(touchscreen)
=E2=80=8B,

getty is only enabled for serial console.

Thanks
Ankur

