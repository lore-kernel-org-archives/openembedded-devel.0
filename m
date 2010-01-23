Received: from mail-iw0-f175.google.com ([209.85.223.175])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <raj.khem@gmail.com>) id 1NYpeh-0003Nr-BU
	for openembedded-devel@lists.openembedded.org;
	Sun, 24 Jan 2010 00:44:42 +0100
Received: by iwn5 with SMTP id 5so762882iwn.24
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 23 Jan 2010 15:42:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:in-reply-to:references
	:date:message-id:subject:from:to:content-type
	:content-transfer-encoding;
	bh=gTM1JoX5ydYHm6jdgHIGRlN+4dwOKYE0hFfx9em/kZY=;
	b=UFhcai+c8NfRbyvQTMkdJAQ+VPokStIx5hgsvuOO1NGNFxwCMqgy5Z6TjvW5f6X4YO
	q5Zono/a1VmTbF0EkV66xQ8WwcVpaqdRm7bbvZY1o0OnGaokX3mMODPkjnLtax9zuFvW
	lchIKhkn62NFsHvQBX+UnA1zjMVq2UIgxOPq8=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type:content-transfer-encoding;
	b=ZmpYPhfb0nDO669zUnaW+Ayw0IMy16wn1djx1+NTrpwtY2/6zgk2zL5ArZ+x0CaSuL
	P+tYlgMqfOOfEKAGbHSY9dzsv5/saoVNjEVIFpK5rx5dIFSgPU0oh4Ri6TEywNWHOqwk
	JGOSQ46hQdmqkDKvmei0mORkXvH/eUz+XkhHU=
MIME-Version: 1.0
Received: by 10.231.151.212 with SMTP id d20mr4843088ibw.53.1264290140018; 
	Sat, 23 Jan 2010 15:42:20 -0800 (PST)
In-Reply-To: <19c1b8a91001231540i7c8573aah13e5ccfbfa7dd290@mail.gmail.com>
References: <201001230943.24210.holger+oe@freyther.de>
	<hjejrf$m65$1@ger.gmane.org>
	<201001231356.29728.holger+oe@freyther.de>
	<19c1b8a91001231540i7c8573aah13e5ccfbfa7dd290@mail.gmail.com>
Date: Sat, 23 Jan 2010 15:42:19 -0800
Message-ID: <19c1b8a91001231542u5c46cfaem697e696ab21ea0d2@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.223.175
X-SA-Exim-Mail-From: raj.khem@gmail.com
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: Re: Patchwork Workflow improvement
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
X-List-Received-Date: Sat, 23 Jan 2010 23:44:42 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

On Sat, Jan 23, 2010 at 3:40 PM, Khem Raj <raj.khem@gmail.com> wrote:
> On Sat, Jan 23, 2010 at 4:56 AM, Holger Hans Peter Freyther
> <holger+oe@freyther.de> wrote:
>> On Saturday 23 January 2010 11:42:56 Koen Kooi wrote:
>>
>>> > 1.) Cherry pick from the branch
>>> > 2.) Send updated patches, close the reports on patchwork...
>>>
>>> I think people that apply those patches to oe.dev should fix up the
>>> commit message as well. The stack Khem pushed this week is just awfull.
>>
> yeah rebasing bit me in foot. my ammended commit messages did not make
> it to repo because I did'nt =A0finish rebasing (git rebase --continue)
> and pushed it. It would have been nice if git warned me about being in
> the middle of rebase before pushing.
>


I guess we could install commit hooks similar to uclibc to rejects
pushes which do
not have proper commit message format and also bogus branch merges that is =
seen
so common

-Khem


