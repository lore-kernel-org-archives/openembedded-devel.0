Received: from [74.125.46.154] (helo=yw-out-1718.google.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <otavio.salvador@gmail.com>) id 1LrbW7-0005Oj-1T
	for openembedded-devel@lists.openembedded.org;
	Wed, 08 Apr 2009 19:24:54 +0200
Received: by yw-out-1718.google.com with SMTP id 9so145683ywk.42
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 08 Apr 2009 10:21:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:sender:received:from:to
	:subject:organization:references:user-agent:x-url:x-attribution:date
	:in-reply-to:message-id:mime-version:content-type;
	bh=9BoQFjDUuaUEI1XsvDXrqO1PVeopVqtbwvcEL3sxWVs=;
	b=BqV9Q3bW6kSiafZr75krD3GVjfECF658P9NqJwCeUDXwraFGEUJOrzFRYdexumcVD6
	CBwZTE3UVQ4dJ6wtK+mhoq7CqBf3T2pdO+NZiVEAlb0tgb8N9xuK6UMqAH25dMjPgDZa
	2GfBXxgdrd9t8d6AE0u+7Wrg5E9boiqTKfENY=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=sender:from:to:subject:organization:references:user-agent:x-url
	:x-attribution:date:in-reply-to:message-id:mime-version:content-type;
	b=GXfkamq+MbXV0hV+uuRhRAkQIOGlZC3NGI1KnUP9qZCsDR8lKqUiZh2Lp0Nxty2bLV
	9tizfvGV6KyIcBjlzpywspP/8VP/VhpSRe0bEQOR1fh/zHCPF6O4YS8HdblAN7nLSAE6
	ypsO1Siosno5wtnMqc5MoRMookQTyy5mdkEQw=
Received: by 10.100.189.8 with SMTP id m8mr3400675anf.87.1239211301375;
	Wed, 08 Apr 2009 10:21:41 -0700 (PDT)
Received: from ossystems.com.br (201-40-162-47.cable.viacabocom.com.br
	[201.40.162.47])
	by mx.google.com with ESMTPS id d29sm181130and.34.2009.04.08.10.21.40
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Wed, 08 Apr 2009 10:21:40 -0700 (PDT)
Sender: Otavio Salvador <otavio.salvador@gmail.com>
Received: by ossystems.com.br (Postfix, from userid 1000)
	id 36390C48E3D; Wed,  8 Apr 2009 14:22:04 -0300 (BRT)
From: Otavio Salvador <otavio@ossystems.com.br>
To: openembedded-devel@lists.openembedded.org
Organization: O.S. Systems Ltda.
References: <1239209556-847-1-git-send-email-clarson@mvista.com>
	<1239209556-847-2-git-send-email-clarson@mvista.com>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/23.0.91 (gnu/linux)
	(x86_64-pc-linux-gnu)
X-URL: http://www.ossystems.com.br/
X-Attribution: O.S.
Date: Wed, 08 Apr 2009 14:22:04 -0300
In-Reply-To: <1239209556-847-2-git-send-email-clarson@mvista.com> (Chris
	Larson's message of "Wed, 8 Apr 2009 09:52:36 -0700")
Message-ID: <87ljqb12o3.fsf@neumann.lab.ossystems.com.br>
MIME-Version: 1.0
X-SA-Exim-Connect-IP: 74.125.46.154
X-SA-Exim-Mail-From: otavio.salvador@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on serenity
X-Spam-Level: 
X-Spam-Status: No, score=-0.7 required=5.0 tests=AWL,BAYES_50,RDNS_NONE,
	SPF_PASS autolearn=no version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:14:11 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: [PATCH] Shorten some full paths printed to the user.
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
X-List-Received-Date: Wed, 08 Apr 2009 17:24:55 -0000
Content-Type: text/plain; charset=us-ascii

Chris Larson <clarson@mvista.com> writes:

> Adds a base_path_out convenience function, which prepares a full path for
> display to the user.  The initial implementation just makes it relative to
> ${TOPDIR}.  This function is then used for some messages outputted to the
> user (packaged-staging, patch application, clean, unpack tasks).
>
> Signed-off-by: Chris Larson <clarson@mvista.com>

Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>

-- 
Otavio Salvador                  O.S. Systems
E-mail: otavio@ossystems.com.br  http://www.ossystems.com.br
Mobile: +55 53 9981-7854         http://projetos.ossystems.com.br


