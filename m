Received: from [209.85.146.181] (helo=wa-out-1112.google.com)
	by linuxtogo.org with esmtp (Exim 4.67)
	(envelope-from <cliff.brake@gmail.com>) id 1Iry8h-0004nM-KJ
	for openembedded-devel@lists.openembedded.org;
	Tue, 13 Nov 2007 16:57:23 +0100
Received: by wa-out-1112.google.com with SMTP id l24so2345021waf
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 13 Nov 2007 07:55:54 -0800 (PST)
Received: by 10.115.54.1 with SMTP id g1mr110637wak.1194968952064;
	Tue, 13 Nov 2007 07:49:12 -0800 (PST)
Received: by 10.114.254.11 with HTTP; Tue, 13 Nov 2007 07:49:12 -0800 (PST)
Message-ID: <f96d234e0711130749u270d6774h8114829b68dcfc6f@mail.gmail.com>
Date: Tue, 13 Nov 2007 10:49:12 -0500
From: "Cliff Brake" <cliff.brake@gmail.com>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <fhc484$6ln$1@ger.gmane.org>
MIME-Version: 1.0
References: <fhc484$6ln$1@ger.gmane.org>
Cc: openembedded-devel@openembedded.org
Subject: Re: Initramfs support?
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.9
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-devel>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 13 Nov 2007 15:57:23 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

On Nov 13, 2007 7:10 AM, Rob Kramer <robk@starhub.net.sg> wrote:

> Anyone know if there's a good way to have OE create an initramfs archive of
> a bunch of files that I provide?

What I do:

- define a custom image or use something like minimal-image
- add cpio.gz to IMAGE_FSTYPES
- use the resulting cpio.gz as your initramfs

The following ramblings may or may not be useful:
http://bec-systems.com/web/content/view/79/9/
http://bec-systems.com/web/content/view/82/9/
http://bec-systems.com/web/content/view/66/9/

Cliff

-- 
=======================
Cliff Brake
http://bec-systems.com


