Received: from [209.85.132.248] (helo=an-out-0708.google.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <otavio.salvador@gmail.com>) id 1LrbVo-0005OP-MG
	for openembedded-devel@lists.openembedded.org;
	Wed, 08 Apr 2009 19:24:37 +0200
Received: by an-out-0708.google.com with SMTP id b2so339237ana.42
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 08 Apr 2009 10:21:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:sender:received:from:to
	:subject:organization:references:user-agent:x-url:x-attribution:date
	:in-reply-to:message-id:mime-version:content-type;
	bh=lvMJRHppsOEm9UXzF0jr6rImP6vEEAD0ptRBcbYTa04=;
	b=xPvNFD4rYwtbDOKxFynjqNWwdTa545h5DEUcCYJ2/qQoeh5H2PF1s+CIdrzf42HcrE
	BfF5H+U3KVOoJTVgANZN/ludhi0yjDCPJPYWxUvvX0xyMefLOcnh+4iicagyie87Hj5g
	CO1PuLvX9dPh1Q453BJ3U7MhS1J62hh+VR9B4=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=sender:from:to:subject:organization:references:user-agent:x-url
	:x-attribution:date:in-reply-to:message-id:mime-version:content-type;
	b=mNXz+xHZWbSGbBIg8BZJVJyWzBxS8fHi6lUVEGlxiBLI2KajHA1qVnQZsKdnLM1V2Y
	GSsXmRH8a6MBeDMJkVLKvnzjxzSCV6f7iJfFXOyyDDxnAywPY8kQKZZu02cvcZ1pMiUt
	d7OUMiL6d0aqP1W7SHxbXqDr/nBG+QAy8viVE=
Received: by 10.100.171.16 with SMTP id t16mr3551040ane.29.1239211288460;
	Wed, 08 Apr 2009 10:21:28 -0700 (PDT)
Received: from ossystems.com.br (201-40-162-47.cable.viacabocom.com.br
	[201.40.162.47])
	by mx.google.com with ESMTPS id d35sm224908and.15.2009.04.08.10.21.27
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Wed, 08 Apr 2009 10:21:28 -0700 (PDT)
Sender: Otavio Salvador <otavio.salvador@gmail.com>
Received: by ossystems.com.br (Postfix, from userid 1000)
	id D4F87C48E3D; Wed,  8 Apr 2009 14:21:49 -0300 (BRT)
From: Otavio Salvador <otavio@ossystems.com.br>
To: openembedded-devel@lists.openembedded.org
Organization: O.S. Systems Ltda.
References: <1239209556-847-1-git-send-email-clarson@mvista.com>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/23.0.91 (gnu/linux)
	(x86_64-pc-linux-gnu)
X-URL: http://www.ossystems.com.br/
X-Attribution: O.S.
Date: Wed, 08 Apr 2009 14:21:48 -0300
In-Reply-To: <1239209556-847-1-git-send-email-clarson@mvista.com> (Chris
	Larson's message of "Wed, 8 Apr 2009 09:52:35 -0700")
Message-ID: <87prfn12oj.fsf@neumann.lab.ossystems.com.br>
MIME-Version: 1.0
X-SA-Exim-Connect-IP: 209.85.132.248
X-SA-Exim-Mail-From: otavio.salvador@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on serenity
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=5.0 tests=AWL,BAYES_50,RDNS_NONE,
	SPF_PASS autolearn=no version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:14:11 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: [PATCH] First pass of cleanup of messages outputted to the user.
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
X-List-Received-Date: Wed, 08 Apr 2009 17:24:39 -0000
Content-Type: text/plain; charset=us-ascii

Chris Larson <clarson@mvista.com> writes:

> OpenEmbedded outputs a lot of messages that the user is likely to never
> care about.  We should only output something when it reflects upon their
> recipe (i.e. unpacking their sources, applying their patches), or is quite
> significant or unusual.
>
> Signed-off-by: Chris Larson <clarson@mvista.com>

Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>

-- 
Otavio Salvador                  O.S. Systems
E-mail: otavio@ossystems.com.br  http://www.ossystems.com.br
Mobile: +55 53 9981-7854         http://projetos.ossystems.com.br


