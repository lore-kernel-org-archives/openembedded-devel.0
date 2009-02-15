Received: from [209.85.221.22] (helo=mail-qy0-f22.google.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <otavio.salvador@gmail.com>) id 1LYloj-0007Yl-5i
	for openembedded-devel@lists.openembedded.org;
	Sun, 15 Feb 2009 19:34:13 +0100
Received: by qyk3 with SMTP id 3so597657qyk.12
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 15 Feb 2009 10:32:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:sender:from:to:subject
	:organization:references:x-url:x-attribution:date:in-reply-to
	:message-id:user-agent:mime-version:content-type;
	bh=T283BLlEH/elBsyWVBQ9osuoDSv4Tuy6xxYh5lIWtG0=;
	b=LKPhkqpW1+xgxPmZ+kxeZd471HOgheH6KOLVXvzqfaJC2h6t89tBLytvXCpXX1a/fJ
	ImvP8EN49YKOxNpj7CQMy7UMItRYnAaqlP0vmScoqEJ+SkxB95Dn8zS73Mb8ABsAx6Zr
	KHRDk03qxAYFq9I1VevnCAD0+5jkRLwJi2xm4=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=sender:from:to:subject:organization:references:x-url:x-attribution
	:date:in-reply-to:message-id:user-agent:mime-version:content-type;
	b=JO3O4g74CZEoGX0Bg/9oTL0RxBhl9QyWkL2L28ykIovdHUoBM0PDBYZHIZwZB+wS5n
	RGBw39X4B/xmQ1nnB+tdLt4qF/EMsGELDM4/2+VA34D3PHeYWr09HjXzpFClwelzpbdg
	964pRzsuohc9OzaZUBRoQTM+AtTPr51YxCoog=
Received: by 10.224.23.203 with SMTP id s11mr6702187qab.52.1234722746602;
	Sun, 15 Feb 2009 10:32:26 -0800 (PST)
Received: from neumann.lab.ossystems.com.br.ossystems.com.br
	(201-40-162-47.cable.viacabocom.com.br [201.40.162.47])
	by mx.google.com with ESMTPS id 5sm4042016qwh.59.2009.02.15.10.32.24
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Sun, 15 Feb 2009 10:32:26 -0800 (PST)
Sender: Otavio Salvador <otavio.salvador@gmail.com>
From: Otavio Salvador <otavio@debian.org>
To: openembedded-devel@lists.openembedded.org
Organization: O.S. Systems Ltda.
References: <200902131728.08634.openembedded@haerwu.biz>
	<878woae03q.fsf@neumann.lab.ossystems.com.br>
	<fce2a370902130939m708ada3dn55be8cdeadacbfbb@mail.gmail.com>
	<871vu2chee.fsf@neumann.lab.ossystems.com.br>
	<1234692280.4890.436.camel@lenovo.internal.reciva.com>
X-URL: http://www.debian.org/~otavio/
X-Attribution: O.S.
Date: Sun, 15 Feb 2009 15:32:17 -0300
In-Reply-To: <1234692280.4890.436.camel@lenovo.internal.reciva.com> (Phil
	Blundell's message of "Sun, 15 Feb 2009 10:04:40 +0000")
Message-ID: <87k57ry2j2.fsf@neumann.lab.ossystems.com.br>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/23.0.90 (gnu/linux)
MIME-Version: 1.0
Subject: Re: checksums situation
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
X-List-Received-Date: Sun, 15 Feb 2009 18:34:13 -0000
Content-Type: text/plain; charset=us-ascii

Phil Blundell <pb@reciva.com> writes:

> For packages where the SRC_URI is defined locally in the .bb file then
> there's no real problem: the existing ";md5sum=..." notation will work
> fine.  For packages where SRC_URI is inherited from some class or
> include file, obviously that doesn't work.  In that case I guess the
> easiest solution is just to put the checksums in a separate variable,
> something like:
>
> CHECKSUMS = "foo_${PV}.tar.bz/md5=076e48835bee2609a3713b35fb89631c"
> CHECKSUMS += "foo_1.0-${PR}.patch/sha1=9bfbeca5db4887b62826da6d0169c62c244f6188"

Yes; I like this solution since it allows it to be with the bb
itself. BTW a nice alternative would be 

#v+
MD5SUMS = "foo_${PV}.tar.bz/076e48835bee2609a3713b35fb89631c"
SHA1SUMS += "foo_1.0-${PR}.patch/9bfbeca5db4887b62826da6d0169c62c244f6188"
#v-

This is more or less what you though however avoids the requirement to
have it specified at the file.

-- 
        O T A V I O    S A L V A D O R
---------------------------------------------
 E-mail: otavio@debian.org      UIN: 5906116
 GNU/Linux User: 239058     GPG ID: 49A5F855
 Home Page: http://otavio.ossystems.com.br
---------------------------------------------
"Microsoft sells you Windows ... Linux gives
 you the whole house."


