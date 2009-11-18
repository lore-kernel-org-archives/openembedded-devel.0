Received: from mail-fx0-f209.google.com ([209.85.220.209])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <otavio.salvador@gmail.com>) id 1NAkJD-00037L-Rc
	for openembedded-devel@lists.openembedded.org;
	Wed, 18 Nov 2009 14:10:58 +0100
Received: by fxm1 with SMTP id 1so1099326fxm.12
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 18 Nov 2009 05:09:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:sender:received:in-reply-to
	:references:date:x-google-sender-auth:message-id:subject:from:to
	:content-type; bh=tLTNxiJbg1M6CEWe8diT/h0h0dMyj2NcAn0Z4vIfSmo=;
	b=ZbTyU/V33kNizzvPQ8vQaTSypXHvWSh4Tq1yzH0wOYabWtqb8wb9/DoK/Q2gAZghFM
	BLc+1Dybiw1ZBsF08E/BPtitGz+3agpbYQxzhV/+RY9w+gUrZPHEwD60suhBrL7e93m0
	Ud3qdRM7JMWYt+0raknLKYcxs6iz4byFcrU9k=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:sender:in-reply-to:references:date
	:x-google-sender-auth:message-id:subject:from:to:content-type;
	b=exA5DA+B+cUbNAufP9nYtK7n0gk8oasLWrieWRVFyPN4r8BsGU2EH/+9ZzsODufcv4
	BNskoGYUq4IBJSC1Yq9sXHr+UYbk2FKnfGYrjHmYbSfWu76efYwPLUbj8yfglK8KMLtv
	J3ZUTmvEY9M1suCgk1Naq4J/c5sNl4qK7NxaE=
MIME-Version: 1.0
Sender: otavio.salvador@gmail.com
Received: by 10.239.190.227 with SMTP id y35mr1042229hbh.212.1258549770148; 
	Wed, 18 Nov 2009 05:09:30 -0800 (PST)
In-Reply-To: <1258504413-25056-1-git-send-email-leon@sidebranch.com>
References: <1258504413-25056-1-git-send-email-leon@sidebranch.com>
Date: Wed, 18 Nov 2009 11:09:30 -0200
X-Google-Sender-Auth: 19e4cb38811801f5
Message-ID: <be7a9f3d0911180509x7df420cetc4ed1575602b68e2@mail.gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.220.209
X-SA-Exim-Mail-From: otavio.salvador@gmail.com
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: Re: [PATCH] squashfs-4.0: update squashfs-tools to include upstream LZMA inclusion.
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
X-List-Received-Date: Wed, 18 Nov 2009 13:10:58 -0000
Content-Type: text/plain; charset=ISO-8859-1

Hello Leon,

On Tue, Nov 17, 2009 at 10:33 PM, Leon Woestenberg
<leon.woestenberg@gmail.com> wrote:
> In OpenEmbedded we used squashfs 4.0 with external patch for LZMA
> compression support. In the meantime, squashfs has mainlined LZMA
> support in its CVS version.
>
> This patches switches to the upstream squashfs-tools and modifies
> bitbake.conf to match the slightly different arguments to mksquashfs.

I agree with the move to mainline version however your recipe changes
might need some improvement. You don't use the lzma recipe available
in OE and instead grab it again ... IMO this is wrong since it
duplicates the lzma source and also make more difficult to us to
"share" fixes.

Besides that  I think it is ok. Can you fix it and send a new patch for review?

Cheers,

-- 
Otavio Salvador                  O.S. Systems
E-mail: otavio@ossystems.com.br  http://www.ossystems.com.br
Mobile: +55 53 9981-7854         http://projetos.ossystems.com.br


