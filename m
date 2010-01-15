Received: from mail-pw0-f53.google.com ([209.85.160.53])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <camelguo@gmail.com>) id 1NVlmX-000389-UT
	for openembedded-devel@lists.openembedded.org;
	Fri, 15 Jan 2010 14:00:09 +0100
Received: by pwi4 with SMTP id 4so253849pwi.12
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 15 Jan 2010 04:57:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:content-type:to:subject
	:references:date:mime-version:content-transfer-encoding:from
	:organization:message-id:in-reply-to:user-agent;
	bh=05RTxYj52DNtcP2Jly2HOqVfw/5pS4k/OADCsI0ljv8=;
	b=joeRrSC35zZzQcffytZ+XumW0gDWAHBSkJ2Csodv31LXOkBoRwjrlHBxAG+iZU8d20
	PLX3gytWkZpbPMrXCLPxHDMpuXlhoBxOHbtM6K1GyxrVlbK12PQ86AuAN55/A4orw1ht
	CfZp5MzQDtX2J3sLem+QLZ+AtW4AdyC62OK40=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=content-type:to:subject:references:date:mime-version
	:content-transfer-encoding:from:organization:message-id:in-reply-to
	:user-agent;
	b=vFd338H32endQ9FBDhFw0aXuFIWbH77bQxJ3ZQK5mfO5EMncn+Y5HTKKP+nXR8NSr/
	rX+Hxs1ABQ0cjPuXgm/oHMp6Zk1GvWbG1p0BkqiB5FnBwGRZfK0nTshlmbCw8otH9/Cr
	N7w2V4dypcZ8g6pU8Pp6yEyqS/yCCd3LmPlRg=
Received: by 10.142.122.1 with SMTP id u1mr613326wfc.297.1263560270881;
	Fri, 15 Jan 2010 04:57:50 -0800 (PST)
Received: from guohr-laptop-ubuntu ([123.54.101.24])
	by mx.google.com with ESMTPS id 20sm1395814pzk.1.2010.01.15.04.57.47
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Fri, 15 Jan 2010 04:57:50 -0800 (PST)
To: openembedded-devel@lists.openembedded.org
References: <> <1263455739-13595-1-git-send-email-camelguo@gmail.com>
	<201001141014.53764.marcin@juszkiewicz.com.pl>
	<op.u6imubdtmn1qzu@guohr-laptop-ubuntu>
	<20100114195301.GA3529@gmail.com>
	<op.u6jv0uycmn1qzu@guohr-laptop-ubuntu> <4B4FE54D.3070402@mwester.net>
	<op.u6kherjdmn1qzu@guohr-laptop-ubuntu>
	<1263549399.457.313.camel@lenovo.internal.reciva.com>
	<op.u6klcvzcmn1qzu@guohr-laptop-ubuntu>
	<1263552396.457.318.camel@lenovo.internal.reciva.com>
	<op.u6kl4xh4mn1qzu@guohr-laptop-ubuntu>
	<1263559808.457.327.camel@lenovo.internal.reciva.com>
Date: Fri, 15 Jan 2010 20:57:40 +0800
MIME-Version: 1.0
From: "Guo Hongruan" <camelguo@gmail.com>
Organization: Gulessoft, Inc
Message-ID: <op.u6krmehqmn1qzu@guohr-laptop-ubuntu>
In-Reply-To: <1263559808.457.327.camel@lenovo.internal.reciva.com>
User-Agent: Opera Mail/10.10 (Linux)
X-SA-Exim-Connect-IP: 209.85.160.53
X-SA-Exim-Mail-From: camelguo@gmail.com
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: Re: [PATCH] Support building all project in one directory
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
X-List-Received-Date: Fri, 15 Jan 2010 13:00:09 -0000
Content-Type: text/plain; charset=utf-8; format=flowed; delsp=yes
Content-Transfer-Encoding: Quoted-Printable

In theory, mixing mutiple DISTROs in one TMPDIR should be fine too, unle=
ss  =

the package recipes use the DISTRO as OVERRIDE.


=E5=9C=A8 Fri, 15 Jan 2010 20:50:08 +0800=EF=BC=8CPhil Blundell <philb@g=
nu.org> =E5=86=99=E9=81=93:

> On Fri, 2010-01-15 at 18:59 +0800, Guo Hongruan wrote:
>> In fact, I just mixer multiple machines in a single TMPDIR with  =

>> different
>> libcs. Hope I am lucky  :)
>
> Yes, mixing multiple MACHINEs in one TMPDIR is fine.
>
> p.
>
>
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


