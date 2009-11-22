Received: from mail-bw0-f217.google.com ([209.85.218.217])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <martin.jansa@gmail.com>) id 1NC9jT-0000sX-Eo
	for openembedded-devel@lists.openembedded.org;
	Sun, 22 Nov 2009 11:31:54 +0100
Received: by bwz9 with SMTP id 9so4199313bwz.12
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 22 Nov 2009 02:30:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:date:from:to:subject
	:message-id:references:mime-version:content-type:content-disposition
	:in-reply-to:user-agent;
	bh=kzOG0IFmjmvB2gvbQUao6X4fJ//c6sLDp+Rnq2JNYEs=;
	b=wJBQD0asdZZYO+LnOqKn++S9t3fqYRbZlcJEtrseLQ0S5jpFm2Q3fqyOD4uiMqhvF7
	pGwzC4iEPROD5VC6kMBCEXakfZ/cZPWTAfIpmBWUBuOqtbvu5Ohn1rz9AcYrEmWtI1SJ
	nl9/KDom8CARCZJW9LbxLm1wmT6ukllKV03iE=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=date:from:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	b=cFVl4qOe85uJCRwIk6qVRdtqoldkk0PPKqZ92rlCmEcIY3V0usymtXbQ5M+Ttr7Das
	0BEzGF2BtsniObTT8MHZnMlLu+BGNqyoU1+MwTrou3nHtLGryuCxezpsatTswcdQqQyl
	NJHXTJaCcHox7hMrKWd7rw2jwKizQiIiONxg0=
Received: by 10.204.48.144 with SMTP id r16mr865288bkf.170.1258885823691;
	Sun, 22 Nov 2009 02:30:23 -0800 (PST)
Received: from localhost (161-24.13.24.78.awnet.cz [78.24.13.161])
	by mx.google.com with ESMTPS id 13sm1041330fxm.13.2009.11.22.02.30.23
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Sun, 22 Nov 2009 02:30:23 -0800 (PST)
Date: Sun, 22 Nov 2009 11:30:22 +0100
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20091122103022.GB4400@jama>
References: <1258782956.5424.17.camel@gnutoo-desktop>
	<alpine.LFD.2.00.0911210112500.25956@localhost>
	<4B07F8F8.3060802@balister.org> <4B082733.1060504@gmx.net>
	<ac9c93b10911211007m44955ef9uc99a0e8cf6408339@mail.gmail.com>
	<20091121183054.GA3299@jama>
	<ac9c93b10911220151p41e1deb9q1cdc0c0210827097@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <ac9c93b10911220151p41e1deb9q1cdc0c0210827097@mail.gmail.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
X-SA-Exim-Connect-IP: 209.85.218.217
X-SA-Exim-Mail-From: martin.jansa@gmail.com
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: Re: [PATCH] wrong checksum for libsdl-mixer-1.2.9
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
X-List-Received-Date: Sun, 22 Nov 2009 10:31:54 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Sun, Nov 22, 2009 at 10:51:52AM +0100, Frans Meulenbroeks wrote:
> I'm flabbergasted.
> 
> The link Philip provided suggests this is a bug fix, but Martin does
> not find any differences ????

I haven't found any notice about SDL_mixer on that news link (only
SDL_image-1.2.9), 

Refreshed date on sources, can be sort of bug fix even without actuall
source change, ie if Makefile don't want to regenerate some file,
because its newer than its "source", but haven't checked if that's the
case.

If someone want's recheck old source and cannot find it, I put it here
http://jama.mk.cvut.cz/SDL_mixer-1.2.9.tar.gz

> Also this does not fix the problem that people will have wrong files
> in their downloads dir.

No idea how to fix this, but for me, if it says I have wrong checksum,
first thing I do is remove local file + check if checksums.ini changed
(hopefully with some ACK or at least by some respectfull commiter)

> Frans (who thingks the package upstream name should have been changed
> after making the patch).

No doubt about it

-- 
uin:136542059                jid:Martin.Jansa@gmail.com
Jansa Martin                 sip:jamasip@voip.wengo.fr 
JaMa                         


