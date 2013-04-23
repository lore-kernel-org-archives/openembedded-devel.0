Received: from mail-oa0-f41.google.com ([209.85.219.41])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <otavio.salvador@gmail.com>) id 1UUc8S-00020a-Dp
	for openembedded-devel@lists.openembedded.org;
	Tue, 23 Apr 2013 14:15:51 +0200
Received: by mail-oa0-f41.google.com with SMTP id g12so475807oah.14
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 23 Apr 2013 04:58:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:x-received:sender:in-reply-to:references:date
	:x-google-sender-auth:message-id:subject:from:to:content-type;
	bh=nEvkQg3D1qq+FYl4tN8w+J6IV0v2RDewmk28oYFIHHs=;
	b=f09hLb7OTM7SEVXcecF4lwKKMAUoQ+/7ZKkwd50Hd8vOKyfokAhgrWCzkKB5AitEAS
	LSAIRS6TuolTtWsyX0lw8rBbicLm+lV+l3AhHDhjLuxD1CtMxY146CP6qPL5q4xeRbu1
	zGygbv7A8EUMS1f95qNQ3PCtzysCCQkWEFluikgUy2zTdLrz6/nP6SPa6RyrEGVqBK/U
	2cGCOYeD3NJEw1zT/XD905P2E/WXfu3yB3Vl1GbW4TD+daPqgX5wK14bfnltRPsm4qHO
	U+gC68XDV5F/3Imi3pv2hoE0nZSZ1+Zmeoi5023KEJ6ccIrW8fBNzmfL3uuMX4WxRR+5
	nkVA==
MIME-Version: 1.0
X-Received: by 10.60.135.103 with SMTP id pr7mr11947941oeb.142.1366718287641; 
	Tue, 23 Apr 2013 04:58:07 -0700 (PDT)
Sender: otavio.salvador@gmail.com
Received: by 10.182.89.226 with HTTP; Tue, 23 Apr 2013 04:58:07 -0700 (PDT)
In-Reply-To: <5175AAA5.3090601@pseudoterminal.org>
References: <5175AAA5.3090601@pseudoterminal.org>
Date: Tue, 23 Apr 2013 08:58:07 -0300
X-Google-Sender-Auth: R3EUh-1bU-8ThVMoXUoHR7qheo4
Message-ID: <CAP9ODKrYAJnOdh0aoOGx0GVR=fdq98YFQVzRQY_KESV4h29cRA@mail.gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: OpenEmbedded Devel List <openembedded-devel@lists.openembedded.org>, 
	=?ISO-8859-1?Q?Eric_B=E9nard?= <ebenard@eukrea.com>
Subject: Re: [meta-oe] libvpx patch backport request
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
X-List-Received-Date: Tue, 23 Apr 2013 12:15:56 -0000
Content-Type: text/plain; charset=ISO-8859-1

On Mon, Apr 22, 2013 at 6:24 PM, Carlos Rafael Giani
<dv@pseudoterminal.org> wrote:
> Hello,
>
> in the meta-oe master branch, commit
> 392e30c21accc720c4e7ae38bc830bfc283a6490 introduces a patch to libvpx that
> fixes the library's hardcoded soft/hardfp flags.
> Without this patch, the library cannot be built for hardfp targets.
> I cherry-picked it on my local repository, and it worked well with danny.

Please when asking for a backport, use 'for-danny' in subject. It is
explained in the README. Otherwise it might be missed. I added Eric in
CC so he can check this.

--
Otavio Salvador                             O.S. Systems
E-mail: otavio@ossystems.com.br  http://www.ossystems.com.br
Mobile: +55 53 9981-7854              http://projetos.ossystems.com.br


