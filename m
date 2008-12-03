Received: from [216.239.58.191] (helo=gv-out-0910.google.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <pmiscml@gmail.com>) id 1L7wzK-0000FD-1w
	for openembedded-devel@lists.openembedded.org;
	Wed, 03 Dec 2008 20:02:18 +0100
Received: by gv-out-0910.google.com with SMTP id o2so719044gve.4
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 03 Dec 2008 10:58:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:date:from:to:subject
	:message-id:in-reply-to:references:x-mailer:mime-version
	:content-type:content-transfer-encoding;
	bh=q9OGKxheZ/voBqS6b7W94U5HaFwj5zfJ8/Q0GOo5vZg=;
	b=OQUBXEyDitEaj0+Btp2j4H25QD6L+BofRWzJv9t9TyU5I5VL0c7np4Cf4dqvlnYiLv
	XxfAGo1VGcBkEHt0xIrT3dmpbjdaiG3706PYnv2h+upt4iFOrOTKUkTdvBgKWA7NXETE
	jFG/EDm9x6qTniiG4pqyEU9d/A8lmPiWO9oXk=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=date:from:to:subject:message-id:in-reply-to:references:x-mailer
	:mime-version:content-type:content-transfer-encoding;
	b=dnqa2698y6axDMWio/6lmxuNY4CWCarptShhqB86xXlMDrKniJWsRN5WgmeOkQ9b+Q
	bGOuMjq0I52skJw4qvelI8iVM/gJ2PXYT1PUtAUhQ2u6y9NVx7A5JcaKhMy8Dk2filDz
	HoLHXOQ3ow4KMs8fyx21CgNGUHB04kCwqJwK0=
Received: by 10.103.182.3 with SMTP id j3mr6336402mup.113.1228330727006;
	Wed, 03 Dec 2008 10:58:47 -0800 (PST)
Received: from widy.localdomain (nat-users-50.is.ua [194.79.8.50])
	by mx.google.com with ESMTPS id y37sm14656859mug.36.2008.12.03.10.58.45
	(version=SSLv3 cipher=RC4-MD5); Wed, 03 Dec 2008 10:58:46 -0800 (PST)
Date: Wed, 3 Dec 2008 21:02:03 +0200
From: Paul Sokolovsky <pmiscml@gmail.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20081203210203.403acbfb@widy.localdomain>
In-Reply-To: <87hc5lp1id.fsf@neumann.lab.ossystems.com.br>
References: <87hc5lp1id.fsf@neumann.lab.ossystems.com.br>
X-Mailer: Claws Mail 3.5.0 (GTK+ 2.12.11; i686-pc-linux-gnu)
Mime-Version: 1.0
Subject: Re: wierd rdepends on libvolume-id-dev
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
X-List-Received-Date: Wed, 03 Dec 2008 19:02:19 -0000
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

Hello,

On Wed, 03 Dec 2008 16:16:58 -0200
Otavio Salvador <otavio@debian.org> wrote:

> Hello,
> 
> I've noticed a very weird rdepends on libvolume-id-dev. Take a look
> bellow:
> 
[]
>  Depends: update-rc.d, libvolume-id-dev (>= 124), libc6 (>= 2.6.1),

I can confirm this for DISTRO=angstrom-2008.1 TARGET_ARCH=arm image
built few days ago. I didn't look into this yet though.


-- 
Best regards,
 Paul                          mailto:pmiscml@gmail.com


