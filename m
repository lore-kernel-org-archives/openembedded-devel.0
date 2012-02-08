Received: from mail-ee0-f47.google.com ([74.125.83.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <otavio.salvador@gmail.com>) id 1Rv5L2-0007O9-3x
	for openembedded-devel@lists.openembedded.org;
	Wed, 08 Feb 2012 12:05:24 +0100
Received: by eekd41 with SMTP id d41so114909eek.6
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 08 Feb 2012 02:57:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=mime-version:sender:in-reply-to:references:date
	:x-google-sender-auth:message-id:subject:from:to:content-type;
	bh=0SaqHC0ZU8I5iFAICuhb+9i/Z84HpRPmE7Asmz5FfGA=;
	b=wEssJc+Bx7neJU5ZhwpdOmAZp9sojQyHLvGSqKO6N/PILA0UaLhjuC3qswJArTc0Bz
	w6YIbwYXky2IMxG/HVMdttQFt61gUzIEu/PVam9TM8KacRcBcoO/JdfAa9s9hcFgGfzk
	bioU3Ox+D8mamedcj7XRm27t5FWAcNksVvrzI=
MIME-Version: 1.0
Received: by 10.14.48.65 with SMTP id u41mr6223324eeb.39.1328698639436; Wed,
	08 Feb 2012 02:57:19 -0800 (PST)
Sender: otavio.salvador@gmail.com
Received: by 10.14.96.129 with HTTP; Wed, 8 Feb 2012 02:57:19 -0800 (PST)
In-Reply-To: <4F31C45B.1010600@linux.intel.com>
References: <1328627573-5217-1-git-send-email-schnitzeltony@googlemail.com>
	<CAP9ODKpi+WWUuf7iP8QgJK2vgmM3KAgS0Fkhbu3eEy80L2eszA@mail.gmail.com>
	<4F31C45B.1010600@linux.intel.com>
Date: Wed, 8 Feb 2012 08:57:19 -0200
X-Google-Sender-Auth: fPuBmA64bYmt7j2wa40Evcubrdc
Message-ID: <CAP9ODKpKWOKung0j2J-BFCpFwBKc-j3usfftuVeJg4eB5MrDFg@mail.gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: openembedded-devel@lists.openembedded.org
X-Content-Filtered-By: Mailman/MimeDel 2.1.11
Subject: Re: [meta-oe][RFC 00/27] systemd / initmanager rework
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
X-List-Received-Date: Wed, 08 Feb 2012 11:05:24 -0000
Content-Type: text/plain; charset=ISO-8859-1

On Tue, Feb 7, 2012 at 22:39, Joshua Lock <josh@linux.intel.com> wrote:
>
>  * The init system ought to be a DISTRO_FEATURE (as sysvinit ought to be
>> too
>> IMO)
>>
>
> I know there's some disagreement with the suggestion that the init system
> ought to be a DISTRO_FEATURE but my (admittedly uninformed) opinion is that
> I can't see how we can avoid it.
>
> It looks like systemd provides various interfaces and API's that packages
> may or may not use and as more packages adopt these we're going to need to
> be able to enable/disable more than just some unit files/scripts for init
> support.


After looking more closely to the polkit issue it seems it is not easy to
avoid, indeed.


>  * I'd like to see sysvinit packages splitted onto ${PN}-sysvinit as well
>>
>
> Agreed. Do we need to think about the case where a systemd based system
> might *need* an initscript (no units available) vs. when the -sysvinit and
> -systemd packages both provide similar functionality?
>
> Would it be desirable for the rootfs generation logic to be able to fall
> back to an alternative "initscript" provider?


Yes for both. sysvinit, for now, ought to be the fallback and in case we
have any sysvinit we need compat-units too.

-- 
Otavio Salvador                             O.S. Systems
E-mail: otavio@ossystems.com.br  http://www.ossystems.com.br
Mobile: +55 53 9981-7854              http://projetos.ossystems.com.br

