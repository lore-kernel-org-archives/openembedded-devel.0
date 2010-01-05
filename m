Received: from mail-yw0-f178.google.com ([209.85.211.178])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <camelguo@gmail.com>) id 1NRydd-0007LI-5A
	for openembedded-devel@lists.openembedded.org;
	Tue, 05 Jan 2010 02:55:16 +0100
Received: by ywh8 with SMTP id 8so15668209ywh.3
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 04 Jan 2010 17:53:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:content-type:to:subject
	:references:date:mime-version:content-transfer-encoding:from
	:organization:message-id:in-reply-to:user-agent;
	bh=yLnUur66r0jOhC4Ry5Q8fVJKshwDgufhvh4rw58v1GQ=;
	b=LMhzgulc/Hgy8kw+CSfwVanqN2jvHMRCyQtTBut7sPmahxAN/DiPKbK9FGBKHgeQq+
	S3NplakuC/amY+h+5pvW7KyeoBE9RCGt5seH8vEGbWvaqYPzobuQzcyCyrQTTGxYLu63
	9/Yktz9vVKn3+h6XAvF98AJm098JGOn8ia1ws=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=content-type:to:subject:references:date:mime-version
	:content-transfer-encoding:from:organization:message-id:in-reply-to
	:user-agent;
	b=xGmIxcUCno0nLsfyJaF1wXTEV4sWSfEVWQllXmewBb6SQiWSKTWt6cDtaEfISJ6ERO
	5iZrTymLAZOaRuX8NX2iG3Ib+nfIYXgBmpVvkvPl3EKuyndmZwfb20sIEnZ2yL06DzVL
	nOt8QU0nI+gSu5z40IYhSjIyqRzWxkMjMMOpk=
Received: by 10.150.120.8 with SMTP id s8mr7556472ybc.185.1262656389536;
	Mon, 04 Jan 2010 17:53:09 -0800 (PST)
Received: from guohr-laptop-ubuntu ([123.54.101.56])
	by mx.google.com with ESMTPS id 36sm7540094yxh.49.2010.01.04.17.53.05
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Mon, 04 Jan 2010 17:53:07 -0800 (PST)
To: openembedded-devel@lists.openembedded.org
References: <op.u5yhl8usmn1qzu@guohr-laptop-ubuntu>
	<20100104191728.GE4326@gmail.com>
Date: Tue, 05 Jan 2010 09:52:59 +0800
MIME-Version: 1.0
From: "Guo Hongruan" <camelguo@gmail.com>
Organization: Gulessoft, Inc
Message-ID: <op.u51d6f11mn1qzu@guohr-laptop-ubuntu>
In-Reply-To: <20100104191728.GE4326@gmail.com>
User-Agent: Opera Mail/10.10 (Linux)
X-SA-Exim-Connect-IP: 209.85.211.178
X-SA-Exim-Mail-From: camelguo@gmail.com
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: Re: compiling glibc-2.6.1 failed due to undefined reference to `_begin
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
X-List-Received-Date: Tue, 05 Jan 2010 01:55:16 -0000
Content-Type: text/plain; charset=utf-8; format=flowed; delsp=yes
Content-Transfer-Encoding: Quoted-Printable

Thanks for your information, I will try it on my site.

  Thanks again.

=E5=9C=A8 Tue, 05 Jan 2010 03:17:28 +0800=EF=BC=8CKhem Raj <raj.khem@gma=
il.com> =E5=86=99=E9=81=93:

> On (03/01/10 20:14), Guo Hongruan wrote:
>> Hi guys:
>>    There is a building failure of org.openembedded.dev. I think it
>> may be a bug of openembedded. Have anyone met the same bug? Or have
>> some idea about it?
>
> I guess you are using latest binutils. There has been changes in ld
> which surfaced this issue. So either you could switch back to using
> older binutils like 2.18 or something. Or you could also port the patc=
h
> recipes/glibc/glibc-2.9/glibc-2.9-use-_begin.patch
>
> -Khem
>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel=



-- =

Guo Hongruan, Embedded Linux Consultant
Skype: camelguo
Twitter: camelguo
http://www.gulessoft.com


