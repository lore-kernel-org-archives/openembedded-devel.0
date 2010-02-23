Received: from mail-iw0-f179.google.com ([209.85.223.179])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <raj.khem@gmail.com>) id 1NjzKu-0008MN-4M
	for openembedded-devel@lists.openembedded.org;
	Tue, 23 Feb 2010 19:18:23 +0100
Received: by iwn9 with SMTP id 9so3558263iwn.3
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 23 Feb 2010 10:15:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:in-reply-to:references
	:date:message-id:subject:from:to:content-type
	:content-transfer-encoding;
	bh=0wzadB0gMAPlQm6THJW6kdUns3YxmESqjvoXwXh3RlE=;
	b=SdrCysEEhoF8NTeP/G6C2MlsIGzVvRXJW2FMyszmbIi3wUdmfJgywJbIZlPf2BuQJv
	WTIz8RqAFo/heYpmiNfcsq18fxJm9rP86SjPJFTND4ODmjTbQGbY1579Uq27WHs2E5oP
	9JH6eXyXAtSuFQXvboi+JMu7hjD+swKuoVXBw=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type:content-transfer-encoding;
	b=pMIDJFzrZ2aWzvSUf9mopM2soqySwe0L+FdJT9uZIaeUt6nWT8pgvTXetem8GI7Ui8
	vS4ZiQSLfC2whb2Ks6NcVp4Gy5IPXzPFJ4pqcQxKboojUTEQhfBL+IDbkMgrsq+JhUMu
	wmgwDI4ypTBOO0Rl+T70zCnHbEN7104jthCPg=
MIME-Version: 1.0
Received: by 10.231.167.204 with SMTP id r12mr185111iby.31.1266948934708; Tue, 
	23 Feb 2010 10:15:34 -0800 (PST)
In-Reply-To: <4B83DC88.7070705@tycoelectronics.com>
References: <mailman.3988.1266916925.14961.openembedded-devel@lists.openembedded.org>
	<4B83DC88.7070705@tycoelectronics.com>
Date: Tue, 23 Feb 2010 10:15:34 -0800
Message-ID: <19c1b8a91002231015l1847354cle068bda32347bd29@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.223.179
X-SA-Exim-Mail-From: raj.khem@gmail.com
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: Re: Openembedded-devel Digest, Vol 43, Issue 98
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
X-List-Received-Date: Tue, 23 Feb 2010 18:18:23 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

On Tue, Feb 23, 2010 at 5:47 AM, Jay Snyder
<jay.snyder@tycoelectronics.com> wrote:
>>
>>
>> try the following:
>> TARGET_CC_ARCH +=3D "${LDFLAGS}"
>> This should resolve your problems if you build your executable from
>> within your OE buildsystem.
>> In very rare cases (e.g. when you build some programs outside of OE
>> but use OE to package all) it could be useful to use the following:
>> INSANE_SKIP_objc =3D "True"
>> AFAIK that sould not be commonly used, but it worked for me.
>>
>> majo
>>
>
> Updating my GCC recipe with a "git pull" worked (the INSANE_SKIP_obj line
> got added sometime recently).
>
> The TARGET_CC_ARCH +=3D "${LDFLAGS}" =A0fix is the first thing that I try=
 when i
> get this problem, and usually fixes it, although there are some packages
> that required patching Makefile.ac files throughout the project.

if you have a list of packages that would be helpful. Generally
packages should respect
LDFLAGS if they dont then probably they should be fixed.

=A0 =A0 As I
> just stated in another reply, when I get beyond the current project time
> crunch (coming up on a release deadline), I will submit my recipe patches
> for inclusion in the OE git repository.

Thats nice.

>
> Thanks,
> Jay
>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>


