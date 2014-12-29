Return-Path: <otavio.salvador@gmail.com>
Received: from mail-yh0-f42.google.com (mail-yh0-f42.google.com
	[209.85.213.42])
	by mail.openembedded.org (Postfix) with ESMTP id 0FD807259D
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 29 Dec 2014 12:02:03 +0000 (UTC)
Received: by mail-yh0-f42.google.com with SMTP id v1so6552890yhn.29
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 29 Dec 2014 04:02:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:sender:date:message-id:subject:from:to:content-type;
	bh=zwSOo3cW2lzMbCI2SDeF58LsD23ATJGiYp8QTUxloBU=;
	b=T1I3F1ZNACZIJ2a4dwA+nyhexUArS7xJYDLEbNuTb8uX1CjkeCGSFo5thWzGcQABXu
	Cd11n2a62oIVlIojd/grbebJQJ4tJLy0+rqKxbEvisSqWznakylCWXr457YiW8+9meEO
	8oGWI1I6RrNfa0FtMCxErBzF/JeDMHslehwXoMTokq1q203rLMBBVGmqEYZ5CFqi0LQM
	QigZZQvU1sp5bJ7jvtBLOxPTxlqT1RzN8+rP7Lwl47BMZLc7cBQ7m+pGme6JR0AXtvsU
	2a8m1FhQL8PvQ1ncUnJ3Ft7BeLdjxgWGVnJ3ua8X7mpupcDnCFjn7GSAojl+Xwjecm3W
	PScQ==
MIME-Version: 1.0
X-Received: by 10.170.130.21 with SMTP id w21mr43469088ykb.22.1419854523788;
	Mon, 29 Dec 2014 04:02:03 -0800 (PST)
Sender: otavio.salvador@gmail.com
Received: by 10.170.171.132 with HTTP; Mon, 29 Dec 2014 04:02:03 -0800 (PST)
Date: Mon, 29 Dec 2014 10:02:03 -0200
X-Google-Sender-Auth: jtPLfCE7AIVRdTJ7EvBom9B1uCU
Message-ID: <CAP9ODKpjdKT8TLxoAgg0aY6zDguRh-rgWchbRpu9T_pew70o7g@mail.gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: OpenEmbedded Devel List <openembedded-devel@lists.openembedded.org>
Subject: lttng-modules failing to build with Linux 3.18
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Mon, 29 Dec 2014 12:02:12 -0000
Content-Type: text/plain; charset=UTF-8

Hello,

We found the following error in our autobuilder:

framebuffer fsl-image-machine-test@imx23evk (3/11) |
.../build-framebuffer/tmp/work/imx23evk-poky-linux-gnueabi/lttng-modules/2.5.0-r0/git/lib/ringbuffer/ring_buffer_frontend.c:
In function 'lib_ring_buffer_open_read':
framebuffer fsl-image-machine-test@imx23evk (3/11) |
.../build-framebuffer/tmp/work/imx23evk-poky-linux-gnueabi/lttng-modules/2.5.0-r0/git/lib/ringbuffer/ring_buffer_frontend.c:795:2:
error: implicit declaration of function 'smp_mb__after_atomic_inc'
[-Werror=implicit-function-declaration]
framebuffer fsl-image-machine-test@imx23evk (3/11) |
smp_mb__after_atomic_inc();
framebuffer fsl-image-machine-test@imx23evk (3/11) |   ^
framebuffer fsl-image-machine-test@imx23evk (3/11) |
.../build-framebuffer/tmp/work/imx23evk-poky-linux-gnueabi/lttng-modules/2.5.0-r0/git/lib/ringbuffer/ring_buffer_frontend.c:
In function 'lib_ring_buffer_release_read':
framebuffer fsl-image-machine-test@imx23evk (3/11) |
.../build-framebuffer/tmp/work/imx23evk-poky-linux-gnueabi/lttng-modules/2.5.0-r0/git/lib/ringbuffer/ring_buffer_frontend.c:805:2:
error: implicit declaration of function 'smp_mb__before_atomic_dec'
[-Werror=implicit-function-declaration]
framebuffer fsl-image-machine-test@imx23evk (3/11) |
smp_mb__before_atomic_dec();
framebuffer fsl-image-machine-test@imx23evk (3/11) |   ^
framebuffer fsl-image-machine-test@imx23evk (3/11) | cc1: some
warnings being treated as errors
framebuffer fsl-image-machine-test@imx23evk (3/11) | make[3]: ***
[.../build-framebuffer/tmp/work/imx23evk-poky-linux-gnueabi/lttng-modules/2.5.0-r0/git/lib/ringbuffer/ring_buffer_frontend.o]
Error 1

Regards,

-- 
Otavio Salvador                             O.S. Systems
http://www.ossystems.com.br        http://code.ossystems.com.br
Mobile: +55 (53) 9981-7854            Mobile: +1 (347) 903-9750

