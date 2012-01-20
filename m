Received: from mail-lpp01m010-f47.google.com ([209.85.215.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <otavio.salvador@gmail.com>) id 1Ro5Px-0004SL-FR
	for openembedded-devel@lists.openembedded.org;
	Fri, 20 Jan 2012 04:45:33 +0100
Received: by lags15 with SMTP id s15so74858lag.6
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 19 Jan 2012 19:37:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=mime-version:sender:in-reply-to:references:date
	:x-google-sender-auth:message-id:subject:from:to:cc:content-type;
	bh=sIvKaVw462phCf5tCAUZ6N7ypcLdS5NE1ialxpytyL0=;
	b=ftqR6QchnBCS4qeNmHCPcB1zYoMNShQnuCk3dma3QwhVq4RWGVaTVB6GF4Phwh3byw
	ZTkfyJdSDflLC2mwE+/ClEzbE7S2HkzMDOErR+u4J5J+dV8uCLaM5F0D/uJOf/YNI+2y
	Q4j3Dg9es5xj5M+XADpXb61q0wl+k4pbHqDGs=
MIME-Version: 1.0
Received: by 10.152.113.2 with SMTP id iu2mr14141896lab.26.1327030673398; Thu,
	19 Jan 2012 19:37:53 -0800 (PST)
Sender: otavio.salvador@gmail.com
Received: by 10.112.30.135 with HTTP; Thu, 19 Jan 2012 19:37:53 -0800 (PST)
In-Reply-To: <1326978353-5558-1-git-send-email-koen@dominion.thruhere.net>
References: <1326978353-5558-1-git-send-email-koen@dominion.thruhere.net>
Date: Fri, 20 Jan 2012 01:37:53 -0200
X-Google-Sender-Auth: DfkzjbPsYDpgrugBt1PrpBrpqoY
Message-ID: <CAP9ODKrcCEUoW+6s2MknUSgtjSOxriU2CSkpSjc7_XOAtUR_Xg@mail.gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: openembedded-devel@lists.openembedded.org
X-Content-Filtered-By: Mailman/MimeDel 2.1.11
Cc: Koen Kooi <koen@dominion.thruhere.net>
Subject: Re: [PATCH 1/2] udev: add 177
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
X-List-Received-Date: Fri, 20 Jan 2012 03:45:33 -0000
Content-Type: text/plain; charset=ISO-8859-1

On Thu, Jan 19, 2012 at 11:05, Koen Kooi <koen@dominion.thruhere.net> wrote:

> * 'udevadm' moved to ${PN} avoiding the need for the udev-utils package to
> be installed, so 'udev' has all the needed programs by itself.
>

NACK!

I have some images that use mdev and I use udevadm to tigger events so
please allow for this flexibility.


> * 'blkid' isn't needed anymore, since 176 udev links against libblkid
> * 'modprobe' and 'depmod' aren't needed anymore, udev now links against
> libkmod
> * The entire source including the license files were re-indented hence the
> LIC_FILES_CHKSUM changes
>

Awesome changes :-)

-- 
Otavio Salvador                             O.S. Systems
E-mail: otavio@ossystems.com.br  http://www.ossystems.com.br
Mobile: +55 53 9981-7854              http://projetos.ossystems.com.br

