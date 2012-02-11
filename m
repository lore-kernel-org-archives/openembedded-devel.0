Received: from mail-ee0-f47.google.com ([74.125.83.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <otavio.salvador@gmail.com>) id 1RwCpP-00026C-6q
	for openembedded-devel@lists.openembedded.org;
	Sat, 11 Feb 2012 14:17:23 +0100
Received: by eekd41 with SMTP id d41so1023845eek.6
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 11 Feb 2012 05:09:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=mime-version:sender:in-reply-to:references:date
	:x-google-sender-auth:message-id:subject:from:to:content-type;
	bh=FaOnfV2Q1IB93uSr9vEnNNiwx0ety4DiRtgwVtZXOzY=;
	b=MobCJFEgjbIOhfU9ttu/hVMpJJTZ743eNYex4OtMQ4pB/drZCw+ZYq6a0/2PZzhuzw
	U6VyczEo1+9GTA9WnVcBX/1CMYK2q63t9wZ8S8Fj+Q2LC+NCunxt4bAaSrr4ZoyOJYuz
	dvtU3aoTJQJdTlUmd2X7Tc3JWdMFFow1pjxgM=
MIME-Version: 1.0
Received: by 10.14.48.65 with SMTP id u41mr3229986eeb.39.1328965756382; Sat,
	11 Feb 2012 05:09:16 -0800 (PST)
Sender: otavio.salvador@gmail.com
Received: by 10.14.96.129 with HTTP; Sat, 11 Feb 2012 05:09:16 -0800 (PST)
In-Reply-To: <1328925603-2967-2-git-send-email-schnitzeltony@googlemail.com>
References: <1328925603-2967-1-git-send-email-schnitzeltony@googlemail.com>
	<1328925603-2967-2-git-send-email-schnitzeltony@googlemail.com>
Date: Sat, 11 Feb 2012 11:09:16 -0200
X-Google-Sender-Auth: J0OrtnszMyMBmtU0C0f_LvPxQyk
Message-ID: <CAP9ODKo94_GmSq0YbKgLO+n__y8rOixra385fSghHCdpfBn+AQ@mail.gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: openembedded-devel@lists.openembedded.org
X-Content-Filtered-By: Mailman/MimeDel 2.1.11
Subject: Re: [meta-oe 2/7] systemd.bbclass: enhance checks for SYSTEMD_PACKAGES and SYSTEMD_SERVICE
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
X-List-Received-Date: Sat, 11 Feb 2012 13:17:23 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

On Fri, Feb 10, 2012 at 23:59, Andreas M=FCller
<schnitzeltony@googlemail.com>wrote:

> +       def systemd_check_vars():
> +               # not for native / only at parse time
>

Doesn't it need to take into account for cross and nativesdk too?

--=20
Otavio Salvador                             O.S. Systems
E-mail: otavio@ossystems.com.br  http://www.ossystems.com.br
Mobile: +55 53 9981-7854              http://projetos.ossystems.com.br

