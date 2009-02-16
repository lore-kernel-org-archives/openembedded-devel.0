Received: from [209.85.221.22] (helo=mail-qy0-f22.google.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <otavio.salvador@gmail.com>) id 1LYs0g-0006aT-L6
	for openembedded-devel@openembedded.org; Mon, 16 Feb 2009 02:10:58 +0100
Received: by qyk3 with SMTP id 3so631386qyk.12
	for <openembedded-devel@openembedded.org>;
	Sun, 15 Feb 2009 17:09:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:sender:received:from:to:cc
	:subject:organization:references:user-agent:x-url:x-attribution:date
	:in-reply-to:message-id:mime-version:content-type;
	bh=gbw3VXFzKmBcVxu/HB3O3sJFYj+zxgjbJi0VT2Aeyq4=;
	b=SPpnxg9o+lxS6cv9IhiCxeML2Zwk7FUpCSOzDaKIjSAW8PAc2Altrk1R7wsmYM/HWZ
	8wUEqqhSsp0ME1+xb+upiUWG3L9Jp/pn8OARR4vUOnyoZ4sY4LZWJTjNtBNWUvn1jsak
	NCq5ir+/f+B4HVctbW5zYo2NsxLMQ/iVxjoYg=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=sender:from:to:cc:subject:organization:references:user-agent:x-url
	:x-attribution:date:in-reply-to:message-id:mime-version:content-type;
	b=bC60uNHmT4NYme6oMWvkx28xPuNzPkW4uE+bfsPB2I0lxZtw5fOvjnvEl0eYNcOnKT
	W6h1XS4UAr3BsW1JvggZiRG0US5NqgIKerz2Ef9AaIDa5FvvQei7flhX2G3fDc/GjiCo
	VyypmB0BXrV3fOwT532pSTjk4yu2Enc5PU2Pk=
Received: by 10.224.28.79 with SMTP id l15mr838313qac.74.1234746549551;
	Sun, 15 Feb 2009 17:09:09 -0800 (PST)
Received: from ossystems.com.br (201-40-162-47.cable.viacabocom.com.br
	[201.40.162.47])
	by mx.google.com with ESMTPS id 5sm1069155qwh.39.2009.02.15.17.09.06
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Sun, 15 Feb 2009 17:09:09 -0800 (PST)
Sender: Otavio Salvador <otavio.salvador@gmail.com>
Received: by ossystems.com.br (Postfix, from userid 1000)
	id CA0F1610067; Sun, 15 Feb 2009 22:09:01 -0300 (BRT)
From: Otavio Salvador <otavio@ossystems.com.br>
To: openembedded-devel@lists.openembedded.org
Organization: O.S. Systems Ltda.
References: <200902140035.13820.khimov@altell.ru>
	<200902140730.32782.openembedded@haerwu.biz>
	<200902141715.56797.khimov@altell.ru>
	<87ocx3y2xu.fsf@neumann.lab.ossystems.com.br>
	<20090215211330.GB11815@smtp.west.cox.net>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/23.0.90 (gnu/linux)
	(x86_64-pc-linux-gnu)
X-URL: http://www.ossystems.com.br/
X-Attribution: O.S.
Date: Sun, 15 Feb 2009 22:09:01 -0300
In-Reply-To: <20090215211330.GB11815@smtp.west.cox.net> (Tom Rini's message of
	"Sun, 15 Feb 2009 14:13:30 -0700")
Message-ID: <87hc2vi3wy.fsf@neumann.lab.ossystems.com.br>
MIME-Version: 1.0
Cc: openembedded-devel@openembedded.org
Subject: Re: [PATCH] New package: siproxd
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
X-List-Received-Date: Mon, 16 Feb 2009 01:10:59 -0000
Content-Type: text/plain; charset=us-ascii

Tom Rini <trini@kernel.crashing.org> writes:

> On Sun, Feb 15, 2009 at 03:23:25PM -0300, Otavio Salvador wrote:
>> Roman I Khimov <khimov@altell.ru> writes:
>> 
>> > Marcin Juszkiewicz:
>> >> On Friday 13 of February 2009 22:35:13 Roman I Khimov wrote:
>> >> > diff --git a/packages/siproxd/siproxd.inc
>> >> >
>> >> > +RDEPENDS = "libosip2"
>> >> >
>> >> > diff --git a/packages/siproxd/siproxd_0.7.1.bb
>> >> >
>> >> > +PR = "r0"
>> >>
>> >> Drop those two lines. You should not add libs to RDEPENDS (OE takes care
>> >> of it) and "r0" is default PR value.
>> >
>> > OK.
>> 
>> It would be quite nice if you could send a git exported patch since it
>> makes the life eaiser for anyone going to apply your commit (locally or
>> for pushing it) and also keeps the credit for you.
>> 
>> If you doesn't know to do that, some guidance can be find at:
>> 
>> http://www.kernel.org/pub/software/scm/git/docs/git-format-patch.html
>
> Maybe getting a little OT, but now that we're starting to use patchwork,
> maybe some comments to GitPhraseBook on how people should be using
> git format-patch for OE?

I fear I'm not the best person to do that since I'm far from a good
English writer.

Basically we could suggest following workflow for regular users:

 - when going to make any change at OE, start a personal branch

   $: git checkout -b local master

 - HACK; HACK; commit
 - once happy with the end result, export the patches to send by mail

   $: git format-patch master..

 - mail them to ml

   $: git send-email 0001-... --to openembedded-devel@lists.openembedded.org

 - go take a beer ;-)

Please someone translate it in something easy to understand :-)

-- 
Otavio Salvador                  O.S. Systems
E-mail: otavio@ossystems.com.br  http://www.ossystems.com.br
Mobile: +55 53 9981-7854         http://projetos.ossystems.com.br


