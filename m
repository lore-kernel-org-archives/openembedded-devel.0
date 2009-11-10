Received: from [209.85.218.217] (helo=mail-bw0-f217.google.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <otavio.salvador@gmail.com>) id 1N7rsN-0004yY-BF
	for openembedded-devel@lists.openembedded.org;
	Tue, 10 Nov 2009 15:39:22 +0100
Received: by bwz9 with SMTP id 9so73254bwz.12
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 10 Nov 2009 06:38:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:sender:received:in-reply-to
	:references:date:x-google-sender-auth:message-id:subject:from:to
	:content-type; bh=cLE3qZhqtQR0EkZ7p8vwHnq4fjVh98bOLVgq5Mvhl/c=;
	b=SerMuSWgAtnUX/WnVmYik7y4Cj3pWmiFl9+zd42m/lniRt/0llmgHpeMcYds+7pai2
	AZjbnzu6U41ZpYkQcS0jwwjns7mrGR2EXT5WJrALoi+nDb7AREqMxRxf1A0JLSqQ8/yt
	80Nlx+v0Vs0LVYZ+DljhXOT0H6mzBTp86W3vM=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:sender:in-reply-to:references:date
	:x-google-sender-auth:message-id:subject:from:to:content-type;
	b=VggFu+G51W9CQvb06n/ORTGlBgCcFP3LOXFnARvyhDTbxGSMcXVLa8gHN1WScNg74J
	aB1RbCECmbGOurLVN0ilze1ONsl6GuJmGgS69oqIqykw5uTQ6hcHrIJO6M0qEj6Kiv/Q
	nlqIpKw/J2mnEtdIxiDpcnrDoeKmc7qBAqlog=
MIME-Version: 1.0
Sender: otavio.salvador@gmail.com
Received: by 10.239.145.33 with SMTP id q33mr14876hba.126.1257863880114; Tue, 
	10 Nov 2009 06:38:00 -0800 (PST)
In-Reply-To: <20091110132756.GC3998@excalibur.local>
References: <1257858446.3077.3.camel@opal>
	<20091110132756.GC3998@excalibur.local>
Date: Tue, 10 Nov 2009 12:38:00 -0200
X-Google-Sender-Auth: 4a15d71ad0f474c8
Message-ID: <be7a9f3d0911100638n45c6aeb5n30d0ed7c7deb1a25@mail.gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.218.217
X-SA-Exim-Mail-From: otavio.salvador@gmail.com
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: Re: OEDEM: Summary of 'OE and Poky', 'Hosting', 'Bugtracker'
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
X-List-Received-Date: Tue, 10 Nov 2009 14:39:22 -0000
Content-Type: text/plain; charset=ISO-8859-1

Hello,

On Tue, Nov 10, 2009 at 11:27 AM, Stefan Schmidt
<stefan@datenfreihafen.org> wrote:
> For me user and other topic branches worked well on the main repository. The
> only issue I have is the flood of commits on the commit ml when a branch gets
> rebased, but that is something that a filter in the commit mail hook should be
> able to solve.

In fact I believe that the best option would be to have individual
trees at the server as is done at git.kernel.org so people can work at
their individual tree and ask for pull or review. That avoids non-used
branches at the main repository.

My 2c.

-- 
Otavio Salvador                  O.S. Systems
E-mail: otavio@ossystems.com.br  http://www.ossystems.com.br
Mobile: +55 53 9981-7854         http://projetos.ossystems.com.br


