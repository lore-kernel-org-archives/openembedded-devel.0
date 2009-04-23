Received: from [209.85.132.240] (helo=an-out-0708.google.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <otavio.salvador@gmail.com>) id 1Lx0IU-0004IX-TZ
	for openembedded-devel@openembedded.org; Thu, 23 Apr 2009 16:53:07 +0200
Received: by an-out-0708.google.com with SMTP id c3so339017ana.30
	for <openembedded-devel@openembedded.org>;
	Thu, 23 Apr 2009 07:48:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:sender:received:in-reply-to
	:references:date:x-google-sender-auth:message-id:subject:from:to:cc
	:content-type:content-transfer-encoding;
	bh=nHxL+ysLQWfueyJCSXBWARBTLKK0niDDEOmEfAA2tSs=;
	b=RbmFG6a+N1dksxKQ/X/WOsOsDv+cEMnS7n1WuVlsdWa8wrQ2rlbLN+pUIEPuO/I7as
	KEQq1P226kkEwJDN4DZr2zXoLB99xYT2oss0O4goKONUdf6gyBZxwFszBvWL5tp4tVsz
	nGWBE9aO6q2hrdf3HECcUUnulBeDlFoMqh2ic=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:sender:in-reply-to:references:date
	:x-google-sender-auth:message-id:subject:from:to:cc:content-type
	:content-transfer-encoding;
	b=W/8LjVqfauj6HLuoaacYhqs7sAPMBkiThQKTEGyr8A057Z6ffrIYX3pz/QkNLUCPj+
	Q51KZ71OLXG92w/n8j5YqiOImbTfZC6JXrLnfzez1gJ78bowhG9ZSmCl7MEWTxc+jU8q
	kinEibC4Axy+mD3AfbF5mBQq/aTi/rukcn54Q=
MIME-Version: 1.0
Sender: otavio.salvador@gmail.com
Received: by 10.100.205.15 with SMTP id c15mr1594988ang.89.1240498108756; Thu, 
	23 Apr 2009 07:48:28 -0700 (PDT)
In-Reply-To: <gspug2$bk9$1@ger.gmane.org>
References: <1240449461-26116-1-git-send-email-otavio@debian.org>
	<1240449461-26116-2-git-send-email-otavio@debian.org>
	<1240449461-26116-3-git-send-email-otavio@debian.org>
	<1240449461-26116-4-git-send-email-otavio@debian.org>
	<gsp1t1$9fq$1@ger.gmane.org>
	<873abzedet.fsf@neumann.lab.ossystems.com.br>
	<gspug2$bk9$1@ger.gmane.org>
Date: Thu, 23 Apr 2009 11:48:28 -0300
X-Google-Sender-Auth: fdebe6f594e47761
Message-ID: <be7a9f3d0904230748q189226f2sb4cc755b283af2c2@mail.gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: openembedded-devel@lists.openembedded.org
Cc: openembedded-devel@openembedded.org
Subject: Re: [PATCH 3/6] machine/geode[gl]x: use more optimization while compiling
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
X-List-Received-Date: Thu, 23 Apr 2009 14:53:07 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

On Thu, Apr 23, 2009 at 11:37 AM, Koen Kooi <k.kooi@student.utwente.nl> wro=
te:
> On 23-04-09 14:56, Otavio Salvador wrote:
>> Koen Kooi<k.kooi@student.utwente.nl> =A0writes:
>>> On 23-04-09 03:17, Otavio Salvador wrote:
>>> shouldn't that be _pn-glibc?
>>
>> You mean the SELECT_OPTIMIZATION?
>
> yes ${PN} is only in local overrides (scope: current recipe), pn-${PN} is=
 in
> global overrides.

Ok, point taken.

>>> And shouldn't you make glibc geode specific after that?
>>
>> Sorry, didn't get what you mean.
>
> You're changing the way glibc is built for a specific machine, so the
> resulting glibc package should technically machine specific. But it seems
> it's compatible with other builds, so there isn't a big impact. This does
> mean that you'll loose the optimization if you build another i586 arch
> first.

Not in this specific case since it uses a different base arch; it builds
all ipk on geode-*.

--=20
Otavio Salvador                  O.S. Systems
E-mail: otavio@ossystems.com.br  http://www.ossystems.com.br
Mobile: +55 53 9981-7854         http://projetos.ossystems.com.br


