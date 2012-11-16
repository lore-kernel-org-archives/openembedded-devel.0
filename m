Received: from mail-pb0-f47.google.com ([209.85.160.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <otavio.salvador@gmail.com>) id 1TZQzs-0001P4-MG
	for openembedded-devel@lists.openembedded.org;
	Fri, 16 Nov 2012 19:50:36 +0100
Received: by mail-pb0-f47.google.com with SMTP id un1so638642pbc.6
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 16 Nov 2012 10:36:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:sender:in-reply-to:references:date
	:x-google-sender-auth:message-id:subject:from:to:cc:content-type;
	bh=rWX7V4WIaJ68w3dg5VYH7/OlgqQTHsb9N4+Xn2Y7efs=;
	b=CZBoH956UG/Itvw7QSHHL1EXoQihjNzbMRt9G9wtmW0Vb/I3F2HLVCVbhIP/d4h9Sq
	dmL9Dt966v2/e+eTWa6+MgB2G5wFQjxF9VHYX5ezsa1hUzV2gH99qt0EX35GDstjJB6l
	oZ9aZyHlefuDakaC6CiTI01hfhkOinGR28MtSP88rzxaF3QnUESyMN879SD11Ol21DTb
	0s2RKWKPkVMXVkrhyxH7TOVojoyIztDL0CDwdo54xBEJmFvoyX2YHVR9/bXVQhQhrEJG
	SrzVYEaYzEoMVRGX3EXeSPHD1hl07UFrBmB2ErCFqfBToctwdWmGh7NTnxf4oYz95cdY
	QKWg==
MIME-Version: 1.0
Received: by 10.66.76.73 with SMTP id i9mr15261842paw.17.1353090997524; Fri,
	16 Nov 2012 10:36:37 -0800 (PST)
Sender: otavio.salvador@gmail.com
Received: by 10.68.16.225 with HTTP; Fri, 16 Nov 2012 10:36:37 -0800 (PST)
In-Reply-To: <1353089491-31640-1-git-send-email-enrico.scholz@sigma-chemnitz.de>
References: <1353082752-8187-1-git-send-email-enrico.scholz@sigma-chemnitz.de>
	<1353089491-31640-1-git-send-email-enrico.scholz@sigma-chemnitz.de>
Date: Fri, 16 Nov 2012 16:36:37 -0200
X-Google-Sender-Auth: 98Xf_IfWSU9RtmJWHFtJF5Ca91s
Message-ID: <CAP9ODKqPMf7Ebn2kM-v=W_qxVQr8i94FqkddnRujL+6CowJ3qA@mail.gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: openembedded-devel@lists.openembedded.org
X-Content-Filtered-By: Mailman/MimeDel 2.1.11
Cc: Enrico Scholz <enrico.scholz@sigma-chemnitz.de>
Subject: Re: [PATCH v2] gitpkgv.bbclass: cache GITPKGV result
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
X-List-Received-Date: Fri, 16 Nov 2012 18:50:36 -0000
Content-Type: text/plain; charset=ISO-8859-1

On Fri, Nov 16, 2012 at 4:11 PM, Enrico Scholz <
enrico.scholz@sigma-chemnitz.de> wrote:

> gitpkgv runs the 'git rev-list | wc -l' several times when processing a
> package using GITPKGV.  This takes ages for packages like the linux
> kernel which has a) a large repository and b) lots of subpackages.
>
> This patch caches the result of 'git rev-list' and uses it on the next
> run.
>
> Signed-off-by: Enrico Scholz <enrico.scholz@sigma-chemnitz.de>
>

I did not test the patch but from reading it seems good.

-- 
Otavio Salvador                             O.S. Systems
E-mail: otavio@ossystems.com.br  http://www.ossystems.com.br
Mobile: +55 53 9981-7854              http://projetos.ossystems.com.br

