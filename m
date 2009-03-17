Received: from [74.125.92.147] (helo=qw-out-1920.google.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <otavio.salvador@gmail.com>) id 1LjfNj-00080u-5I
	for openembedded-devel@lists.openembedded.org;
	Tue, 17 Mar 2009 20:55:26 +0100
Received: by qw-out-1920.google.com with SMTP id 5so148312qwf.36
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 17 Mar 2009 12:54:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:sender:received:from:to:cc
	:subject:organization:references:user-agent:x-url:x-attribution:date
	:in-reply-to:message-id:mime-version:content-type
	:content-transfer-encoding;
	bh=kHb1Xfen62WTIpyQpJVCCNH7sNidxMrPKNl+2GuV7YY=;
	b=IRvv8CvG2i5ttJNO5YNpMF55yAiDYzgmLYwu7cuglnRDbQOXDtzlOX0xTbGGpBcE4Z
	K3BvwUNDJtWefSyelLbwAb9qYPEdEycjrpCCKmcWuvJJ4ZvXNDeYX7DHRXYOtKq4aoZf
	pyxt2PL8tkPsNi0oQ+iSiIAoTpK2QXdm12TGg=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=sender:from:to:cc:subject:organization:references:user-agent:x-url
	:x-attribution:date:in-reply-to:message-id:mime-version:content-type
	:content-transfer-encoding;
	b=UMlfbrZNQ4N71kdcknaMgd/8FuJUJ9f5IRDdCWc6pAbCDnVn1YDdnFtsFmxReIS85+
	wUvFB3f5iOsY9pBMZ0554BiEN2xpPFhZWx9iogsU1w5Q+YF0cM8GXHI/xkKoJM/epIGb
	cNbVvAciuhLPE285x8JVC9TujvFWdSdJGgbaQ=
Received: by 10.224.37.17 with SMTP id v17mr753434qad.128.1237319677061;
	Tue, 17 Mar 2009 12:54:37 -0700 (PDT)
Received: from ossystems.com.br (201-40-162-47.cable.viacabocom.com.br
	[201.40.162.47])
	by mx.google.com with ESMTPS id 9sm17568998yws.5.2009.03.17.12.54.36
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Tue, 17 Mar 2009 12:54:36 -0700 (PDT)
Sender: Otavio Salvador <otavio.salvador@gmail.com>
Received: by ossystems.com.br (Postfix, from userid 1000)
	id C7DCB610226; Tue, 17 Mar 2009 16:54:32 -0300 (BRT)
From: Otavio Salvador <otavio@ossystems.com.br>
To: openembedded-devel@lists.openembedded.org
Organization: O.S. Systems Ltda.
References: <1237246365-32076-1-git-send-email-denis@denix.org>
	<49BFB6D8.5060804@student.utwente.nl>
	<ac9c93b10903171019l3074c648r1ba2bfff23a31aac@mail.gmail.com>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/23.0.91 (gnu/linux)
	(x86_64-pc-linux-gnu)
X-URL: http://www.ossystems.com.br/
X-Attribution: O.S.
Date: Tue, 17 Mar 2009 16:54:32 -0300
In-Reply-To: <ac9c93b10903171019l3074c648r1ba2bfff23a31aac@mail.gmail.com>
	(Frans Meulenbroeks's message of "Tue, 17 Mar 2009 18:19:54 +0100")
Message-ID: <871vswlybr.fsf@neumann.lab.ossystems.com.br>
MIME-Version: 1.0
X-SA-Exim-Connect-IP: 74.125.92.147
X-SA-Exim-Mail-From: otavio.salvador@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on serenity
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=5.0 tests=BAYES_00,RDNS_NONE,SPF_PASS
	autolearn=no version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:14:11 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Cc: openembedded-devel@openembedded.org
Subject: Re: [PATCH 0/3] rename packages/ to recipes/ per earlier agreement
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
X-List-Received-Date: Tue, 17 Mar 2009 19:55:26 -0000
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

Frans Meulenbroeks <fransmeulenbroeks@gmail.com> writes:

> 2009/3/17 Koen Kooi <k.kooi@student.utwente.nl>:
>> On 17-03-09 00:32, Denys Dmytriyenko wrote:
>>>
>>> Renaming packages/ directory to recipes/, as one of the several structu=
ral
>>> changes, was proposed by Koen[1] and agreed/approved by many. Since Koen
>>> currently doesn't have time/ability to do the change, and some people a=
re
>>> too eager to wait any longer, he asked me to do it. Please ack/nack.
>>>
>>> [1] http://thread.gmane.org/gmane.comp.handhelds.openembedded/21326
>>>
>>> Denys Dmytriyenko (3):
>>> =C2=A0 rename packages/ to recipes/ per earlier agreement
>>> =C2=A0 recipes: fix hardcoded instances of packages/
>>> =C2=A0 base.bbclass: fix base_get_scmbasepath() to look for recipes/ and
>>> =C2=A0 =C2=A0 fall back to packages/ while parsing BBFILES
>>
>> Acked-By: Koen Kooi <koen@openembedded.org>
>>
>> Now, if you use patchwork, these acks and SOBs get added to your patch
>> automagically :)
>>
>> regards,
>>
>> Koen
>>
>>
>> _______________________________________________
>> Openembedded-devel mailing list
>> Openembedded-devel@lists.openembedded.org
>> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>>
> Acked-By: Frans Meulenbroeks <fransmeulenbroeks@gmail.com>

Acked-By: Otavio Salvador <otavio@ossystems.com.br>

--=20
Otavio Salvador                  O.S. Systems
E-mail: otavio@ossystems.com.br  http://www.ossystems.com.br
Mobile: +55 53 9981-7854         http://projetos.ossystems.com.br


