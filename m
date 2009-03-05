Received: from [209.85.219.167] (helo=mail-ew0-f167.google.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <otavio.salvador@gmail.com>) id 1LfDv7-0006oJ-Uy
	for openembedded-devel@lists.openembedded.org;
	Thu, 05 Mar 2009 14:47:34 +0100
Received: by ewy11 with SMTP id 11so1634953ewy.12
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 05 Mar 2009 05:43:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:sender:received:from:to:cc
	:subject:organization:references:user-agent:x-url:x-attribution:date
	:in-reply-to:message-id:mime-version:content-type;
	bh=G7+PPOeO88VcbjYKpcU98EdGBycyR4mrikkLvkpvV9c=;
	b=C9LK5W/keFvdB488E7648WopBLmuCIAUUE2LPLcbC0nSJIPK2UYOTJe/uw+5XOnFKi
	blPxQyt7dTdMhZcWiJ4+nY9tlQVwPUFA7ApMd2YEMkPm4C7FJRUDA+ncGF8nbrYh/Hft
	+/D9X3FB5vkyi+Wojc9jiBapzT0S+FUXiD8fk=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=sender:from:to:cc:subject:organization:references:user-agent:x-url
	:x-attribution:date:in-reply-to:message-id:mime-version:content-type;
	b=mQOUk8pz5adkBgka3nvMEBrCiWCKR7NeI030TwtnKa2H4XiX6IFryy4vZSMJOOqaFy
	GjJVcZLNnxAlKgqgIgEqW7xj56lJUw9gKrKqkqsmbHCaNkL59ZwmpsMDHp0Ub8AxOKV5
	NXHyeSPHM3sXuUchgO7T3G30AKY0cUuTdlUXE=
Received: by 10.216.2.207 with SMTP id 57mr683195wef.174.1236260587605;
	Thu, 05 Mar 2009 05:43:07 -0800 (PST)
Received: from ossystems.com.br (201-40-162-47.cable.viacabocom.com.br
	[201.40.162.47])
	by mx.google.com with ESMTPS id t12sm9820989gvd.8.2009.03.05.05.43.05
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Thu, 05 Mar 2009 05:43:07 -0800 (PST)
Sender: Otavio Salvador <otavio.salvador@gmail.com>
Received: by ossystems.com.br (Postfix, from userid 1000)
	id 020EE6101CE; Thu,  5 Mar 2009 10:43:04 -0300 (BRT)
From: Otavio Salvador <otavio@ossystems.com.br>
To: Mario Domenech Goulart <mario@ossystems.com.br>
Organization: O.S. Systems Ltda.
References: <87iqmp5f58.fsf@neumann.lab.ossystems.com.br>
	<87eixc40oz.fsf@ucpel.tche.br>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/23.0.91 (gnu/linux)
	(x86_64-pc-linux-gnu)
X-URL: http://www.ossystems.com.br/
X-Attribution: O.S.
Date: Thu, 05 Mar 2009 10:43:04 -0300
In-Reply-To: <87eixc40oz.fsf@ucpel.tche.br> (Mario Domenech Goulart's message
	of "Wed, 04 Mar 2009 15:34:57 -0300")
Message-ID: <87skls2ihj.fsf@neumann.lab.ossystems.com.br>
MIME-Version: 1.0
Cc: openembedded-devel@lists.openembedded.org,
	Otavio Salvador <otavio@ossystems.com.br>
Subject: Re: [RFH] Support for automatic package versining using git describe
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
X-List-Received-Date: Thu, 05 Mar 2009 13:47:43 -0000
Content-Type: text/plain; charset=us-ascii

Mario Domenech Goulart <mario@ossystems.com.br> writes:


[...]

> Index: lib/bb/fetch/git.py
> ===================================================================
> --- lib/bb/fetch/git.py	(revision 1152)
> +++ lib/bb/fetch/git.py	(working copy)
> @@ -42,11 +42,12 @@
>              ud.proto = ud.parm['protocol']
>  
>          ud.branch = ud.parm.get("branch", "master")
> +        ud.tag = None
>  
>          tag = Fetch.srcrev_internal_helper(ud, d)
>          if tag is True:
>              ud.tag = self.latest_revision(url, ud, d)	
> -        elif tag:
> +        elif tag and tag != "1":
>              ud.tag = tag
>  
>          if not ud.tag or ud.tag == "master":

[...]

Please drop this hook since it is our internal workaround for the lack
of the AUTOREV in our recipes.

-- 
Otavio Salvador                  O.S. Systems
E-mail: otavio@ossystems.com.br  http://www.ossystems.com.br
Mobile: +55 53 9981-7854         http://projetos.ossystems.com.br


