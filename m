Received: from [209.85.221.124] (helo=mail-qy0-f124.google.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <otavio.salvador@gmail.com>) id 1LrteB-0003U6-6p
	for openembedded-devel@lists.openembedded.org;
	Thu, 09 Apr 2009 14:46:30 +0200
Received: by qyk30 with SMTP id 30so999663qyk.24
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 09 Apr 2009 05:43:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:sender:received:from:to
	:subject:organization:references:user-agent:x-url:x-attribution:date
	:in-reply-to:message-id:mime-version:content-type;
	bh=qjVd+Xx0tMOhT6vPDortt7/OiRczOj71N2LPyZ8Q020=;
	b=GzMG2zUBCkgCeT9TQ9GcpoMecYTcrY1UqUsxRFoxWNfQzREead/5BtyDGROphpWLyw
	t6oHh/8zKlUSc1BRkR9UWWI3nNu4jIXNmKx/N2oL0Op3fKPhxp7IRcBBmTqV/5pK1rbx
	sXHZdX/IeFXAApfiO+nv+RIebSU6iVx7CABhY=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=sender:from:to:subject:organization:references:user-agent:x-url
	:x-attribution:date:in-reply-to:message-id:mime-version:content-type;
	b=UbQTz7SepOGX4s6bpsiiT+evFSNZCyHmrTu1H0SKZ+SdbWHAX3tNdcgkaQx05MaJDr
	s1Hpj4t2DYPVp3D4DqkIsAm3Nfqg9jmkGl+79olO++Sf19PZCUM85pOK/iXeXVC8/Kkb
	u+KJq815ybt4EuaTOoQJ1lr9ilUf9qU+DMgcU=
Received: by 10.224.37.79 with SMTP id w15mr2699409qad.139.1239280991165;
	Thu, 09 Apr 2009 05:43:11 -0700 (PDT)
Received: from ossystems.com.br (201-40-162-47.cable.viacabocom.com.br
	[201.40.162.47])
	by mx.google.com with ESMTPS id 9sm290392yws.35.2009.04.09.05.43.10
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Thu, 09 Apr 2009 05:43:10 -0700 (PDT)
Sender: Otavio Salvador <otavio.salvador@gmail.com>
Received: by ossystems.com.br (Postfix, from userid 1000)
	id 87F0A610090; Thu,  9 Apr 2009 09:43:35 -0300 (BRT)
From: Otavio Salvador <otavio@ossystems.com.br>
To: openembedded-devel@lists.openembedded.org
Organization: O.S. Systems Ltda.
References: <1239209556-847-1-git-send-email-clarson@mvista.com>
	<87prfn12oj.fsf@neumann.lab.ossystems.com.br>
	<20090408184641.GB14502@denix.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/23.0.91 (gnu/linux)
	(x86_64-pc-linux-gnu)
X-URL: http://www.ossystems.com.br/
X-Attribution: O.S.
Date: Thu, 09 Apr 2009 09:43:35 -0300
In-Reply-To: <20090408184641.GB14502@denix.org> (Denys Dmytriyenko's message
	of "Wed, 08 Apr 2009 14:46:41 -0400")
Message-ID: <87hc0y0zgo.fsf@neumann.lab.ossystems.com.br>
MIME-Version: 1.0
X-SA-Exim-Connect-IP: 209.85.221.124
X-SA-Exim-Mail-From: otavio.salvador@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on serenity
X-Spam-Level: 
X-Spam-Status: No, score=-0.6 required=5.0 tests=AWL,BAYES_50,RDNS_NONE,
	SPF_PASS autolearn=no version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:14:11 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: [PATCH] First pass of cleanup of messages outputted to	the user.
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
X-List-Received-Date: Thu, 09 Apr 2009 12:46:30 -0000
Content-Type: text/plain; charset=us-ascii

Denys Dmytriyenko <denis@denix.org> writes:

> On Wed, Apr 08, 2009 at 02:21:48PM -0300, Otavio Salvador wrote:
>> Chris Larson <clarson@mvista.com> writes:
>> 
>> > OpenEmbedded outputs a lot of messages that the user is likely to never
>> > care about.  We should only output something when it reflects upon their
>> > recipe (i.e. unpacking their sources, applying their patches), or is quite
>> > significant or unusual.
>> >
>> > Signed-off-by: Chris Larson <clarson@mvista.com>
>> 
>> Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>
>
> Did you mean Acked-by? :)

No, since I'm not a core developer :-)

-- 
Otavio Salvador                  O.S. Systems
E-mail: otavio@ossystems.com.br  http://www.ossystems.com.br
Mobile: +55 53 9981-7854         http://projetos.ossystems.com.br


