Received: from [74.125.92.149] (helo=qw-out-1920.google.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <otavio.salvador@gmail.com>) id 1LwPq9-0002wL-Ml
	for openembedded-devel@lists.openembedded.org;
	Wed, 22 Apr 2009 01:57:25 +0200
Received: by qw-out-1920.google.com with SMTP id 9so1398675qwj.36
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 21 Apr 2009 16:52:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:sender:received:from:to
	:subject:organization:references:user-agent:x-url:x-attribution:date
	:in-reply-to:message-id:mime-version:content-type;
	bh=XRjStmehQIC0wz5LtkGtMNMTCYYjWESwY6TCyAFiueU=;
	b=xTMGBAFnshMIE+8hNWUatGyhUUOA1oL8qcgBhw/nLcmzfrP96N92KujCadWPpeg79v
	Xv/m7mRXFEHjyaGDyuoAF8J1R44p6+P/3cUSZ/jr1cYVveUN8JhI1Fo67V2zBgjKMmMb
	jgF8hSkjxksVQs5MKNDypjhMhrjDdFUKj9Yjw=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=sender:from:to:subject:organization:references:user-agent:x-url
	:x-attribution:date:in-reply-to:message-id:mime-version:content-type;
	b=AmK6VZ+nsB0xa5iwIo8G6bt9kZIh+xNZwY3xkmOow3/pNsIJA99YpUlTMh/HyNFrFk
	S4i/L3sQ+a0D+v/wquQt/Y7n84D0qJSjagZbfisdEcjsp3Yyr7k9WsIX6PojCLHuLR3x
	nz29tHSt7QcqWhWI9Kb54PokddnbPwL2xAD9E=
Received: by 10.220.76.74 with SMTP id b10mr9358451vck.41.1240357977262;
	Tue, 21 Apr 2009 16:52:57 -0700 (PDT)
Received: from ossystems.com.br (201-40-162-47.cable.viacabocom.com.br
	[201.40.162.47])
	by mx.google.com with ESMTPS id 6sm11792279ywn.22.2009.04.21.16.52.56
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Tue, 21 Apr 2009 16:52:56 -0700 (PDT)
Sender: Otavio Salvador <otavio.salvador@gmail.com>
Received: by ossystems.com.br (Postfix, from userid 1000)
	id 2936D610081; Tue, 21 Apr 2009 20:52:50 -0300 (BRT)
From: Otavio Salvador <otavio@ossystems.com.br>
To: openembedded-devel@lists.openembedded.org
Organization: O.S. Systems Ltda.
References: <1238399997-6016-1-git-send-email-khimov@altell.ru>
	<c384c5ea0904211352o406880cbp2846efd6e0125038@mail.gmail.com>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/23.0.92 (gnu/linux)
	(x86_64-pc-linux-gnu)
X-URL: http://www.ossystems.com.br/
X-Attribution: O.S.
Date: Tue, 21 Apr 2009 20:52:50 -0300
In-Reply-To: <c384c5ea0904211352o406880cbp2846efd6e0125038@mail.gmail.com>
	(Leon Woestenberg's message of "Tue, 21 Apr 2009 22:52:49 +0200")
Message-ID: <87eivlef8t.fsf@neumann.lab.ossystems.com.br>
MIME-Version: 1.0
Subject: Re: [PATCH] image.bbclass: reorder do_rootfs
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
X-List-Received-Date: Tue, 21 Apr 2009 23:57:25 -0000
Content-Type: text/plain; charset=us-ascii

Hello Leon,

Leon Woestenberg <leon.woestenberg@gmail.com> writes:

> On Mon, Mar 30, 2009 at 9:59 AM, Roman I Khimov <khimov@altell.ru> wrote:
>> Places do_rootfs function before do_install in image creation process.
>>
>> This change allows multiimage builds, when one image depends on another (before
>> that second image creation raced with do_rootfs for the first one) and uses
>> it for some purpose.
>>
>> Multiimage builds are useful in situations like creating an installer image
>> with initramfs (built in OE) and an image of the target FS (also built in OE)
>> or for building virtualized system images to be placed on target FS.
>> ---
>
> This looks *very* useful.
>
> However, this might break stuff as it is intrusive. So HEADS UP everyone! :-)

[...]

Mind to explain how it can break things?

-- 
Otavio Salvador                  O.S. Systems
E-mail: otavio@ossystems.com.br  http://www.ossystems.com.br
Mobile: +55 53 9981-7854         http://projetos.ossystems.com.br


