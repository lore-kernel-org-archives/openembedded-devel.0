Received: from [74.125.44.155] (helo=yx-out-1718.google.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <cliff.brake@gmail.com>) id 1LCxep-0000Ro-VR
	for openembedded-devel@lists.openembedded.org;
	Wed, 17 Dec 2008 15:45:52 +0100
Received: by yx-out-1718.google.com with SMTP id 4so1607157yxp.42
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 17 Dec 2008 06:41:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:message-id:date:from:to
	:subject:in-reply-to:mime-version:content-type
	:content-transfer-encoding:content-disposition:references;
	bh=wsSNHnOkH/wuYY+56NWRQcf85NZwdlxP90Lja0XgYEc=;
	b=pmKpqTThwKbCSa4xwmEo9bAtrlw3owEfh2QXNjwFtXamr5M8v98vlyzl8Tncgvao4t
	lOi6D4AAfym6R5XPEiYdPHAKQ14IuOuEb5OPcSq4ZbK2VxLi2Fnf+Abf4Yy7jOPiIFjt
	pn4rxOr4U1pvuiLXTaIDIsEmzNcYFa6J9PVFE=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=message-id:date:from:to:subject:in-reply-to:mime-version
	:content-type:content-transfer-encoding:content-disposition
	:references;
	b=S7Qy8KVNMRLBf5dF8cq7kjGUw5iJciP2BkbDbJNpRBFL47i/IyWTwXfhJMJXNL9rwy
	a2wpNf/n3pPlFIgeXhLw8fdYeRMwj3ZXmjOqQHwLnJMO4Pia2vsyJpakim8lGgd/BGXt
	wiCis7bg0qBa8P69jxVMfoM5gzGn99n119XZw=
Received: by 10.151.38.12 with SMTP id q12mr1462093ybj.149.1229524880299;
	Wed, 17 Dec 2008 06:41:20 -0800 (PST)
Received: by 10.151.116.4 with HTTP; Wed, 17 Dec 2008 06:41:20 -0800 (PST)
Message-ID: <f96d234e0812170641u414f82ccs70921455c138761c@mail.gmail.com>
Date: Wed, 17 Dec 2008 09:41:20 -0500
From: "Cliff Brake" <cliff.brake@gmail.com>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <494907CC.2020009@epfl.ch>
MIME-Version: 1.0
References: <494907CC.2020009@epfl.ch>
Subject: Re: Best way to tune a distro and to build a toolchain for it
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
X-List-Received-Date: Wed, 17 Dec 2008 14:45:52 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

On Wed, Dec 17, 2008 at 9:08 AM, Valentin Longchamp
<valentin.longchamp@epfl.ch> wrote:
> Hello,
>
> We have designed a processor board in our laboratory that we are going to
> use to control our robots for experiments. The board is now supported in OE
> (mx31moboard machine) and I am very happy to be able to build a Linux distro
> for our board thank to OE.
>
> Until now I have used the Angstrom distro with success. Now since my use is
> mostly going to be for a robot with no screen (and of course no PIM/agenda,
> games and these kinds of things) I have always built a console-image.
> However now I would like to add some packages by default in the images that
> I want to build for our robot (for instance hal is needed by one of our
> softs, I would like it to be included by default).
>
> I could do this by adding these packages in the MACHINE_EXTRA_RDEPENDS
> variable in the machine config file, but I think this is more a distro
> question.
>
> To summarize: what would be the best way to create a "robotic version" of
> angstrom in OE ?

Define a custom image: http://bec-systems.com/web/content/view/79/9/

Cliff

-- 
=======================
Cliff Brake
http://bec-systems.com


