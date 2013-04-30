Received: from mail-ob0-f179.google.com ([209.85.214.179])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <otavio.salvador@gmail.com>) id 1UXCfq-00054N-OB
	for openembedded-devel@lists.openembedded.org;
	Tue, 30 Apr 2013 17:41:04 +0200
Received: by mail-ob0-f179.google.com with SMTP id oi10so534002obb.24
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 30 Apr 2013 08:22:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:x-received:sender:in-reply-to:references:date
	:x-google-sender-auth:message-id:subject:from:to:content-type;
	bh=tuWgxBVwt3gpQoeQUOBGtUqZy5B6UA2zd5eRwUsFxNA=;
	b=TB1YtNlrNkegDfCpFJtuIUBgXK43A0PCg0fqIf5KJJEbhgb01JsmhZou0A2UXvvSDQ
	10PDGqX6rf9WFe3r9cITHWXSycO2U1mJ/EqX2OYvlKg1vOYwARv/d4kwvd8g1Uk7Xy1t
	rWjoxdCkmQAecW6LL3cB/O79+/XxMiTiK4EIFmBcqviVeillSvwZsPVHVJUFlBgZm9mT
	/RhI5dFpxOuFwq/LaQFq9PWQPk7wLWr3VfM/yRnK8GA/nssmUcSsF6cxEshMrKl2sCEX
	W3lYJ4zYSrz/iQUwt4QMIPiW3p7P89F2+M3BHjl7/qYbaXAHClDTsN2YJeRrjvR5a1mE
	ziyA==
MIME-Version: 1.0
X-Received: by 10.182.60.1 with SMTP id d1mr2708057obr.33.1367335379321; Tue,
	30 Apr 2013 08:22:59 -0700 (PDT)
Sender: otavio.salvador@gmail.com
Received: by 10.182.89.226 with HTTP; Tue, 30 Apr 2013 08:22:59 -0700 (PDT)
In-Reply-To: <CAJTo0LaF8rOcnfVFhqwrtsfAK3Pu4i79Zz27RV7XPpdo0UZU1Q@mail.gmail.com>
References: <CAP9ODKpttkSQqRinJQWmDhWTeE+iXJWnLBDqZ1rsath6tJ2Xmw@mail.gmail.com>
	<CAJTo0LaF8rOcnfVFhqwrtsfAK3Pu4i79Zz27RV7XPpdo0UZU1Q@mail.gmail.com>
Date: Tue, 30 Apr 2013 12:22:59 -0300
X-Google-Sender-Auth: U6e1QBilPJJVNt_h2qqoLBgUyGs
Message-ID: <CAP9ODKrUJgBvJSocDxp15PtLtP8ObW-+-OgdedbSDt=1ALR9ow@mail.gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: OpenEmbedded Devel List <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-gnome] gvfs build error
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
X-List-Received-Date: Tue, 30 Apr 2013 15:41:15 -0000
Content-Type: text/plain; charset=ISO-8859-1

On Tue, Apr 30, 2013 at 11:58 AM, Burton, Ross <ross.burton@intel.com> wrote:
> On 30 April 2013 15:42, Otavio Salvador <otavio@ossystems.com.br> wrote:
>> Hello,
>>
>> Did someone see:
>>
>> | metatree.c:71:1: error: unknown type name 'GStaticRWLock'
>> | metatree.c:71:38: error: 'G_STATIC_RW_LOCK_INIT' undeclared here
>> (not in a function)
>> | metatree.c: In function 'meta_tree_ref':
>
> Those APIs are deprecated in new GLibs, so maybe you've a newer GLib
> and an older gvfs, potentially one that is disabling deprecated code
> (which is bad form, and shouldn't be done in GNOME these days afaik).

I think you're  right as it used to work fine and now it broke.

It seems meta-gnome will need some love with master updates now :-)

--
Otavio Salvador                             O.S. Systems
E-mail: otavio@ossystems.com.br  http://www.ossystems.com.br
Mobile: +55 53 9981-7854              http://projetos.ossystems.com.br


