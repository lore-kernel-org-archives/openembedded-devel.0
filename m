Received: from [209.85.221.124] (helo=mail-qy0-f124.google.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <xjqian@gmail.com>) id 1LmBop-0000oH-0Q
	for openembedded-devel@lists.openembedded.org;
	Tue, 24 Mar 2009 19:57:47 +0100
Received: by qyk30 with SMTP id 30so3502449qyk.24
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 24 Mar 2009 11:56:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:message-id:date:from:reply-to
	:user-agent:mime-version:to:subject:references:in-reply-to
	:content-type:content-transfer-encoding;
	bh=mGsAh3jjxsuyIzM6CyeeCEOQIcyRzCNacKlvHfxqXsY=;
	b=RXi491D6EqLDKZ+znQ+vU/NEkUvx0Wv8Hhq6hKmTFjHN3bF7i8taB2JOvbsHE+M9q1
	A5norn5GS+GaM3eGw83ldulbw0ZGA3KC7wX2F+pklXHR2m4wrDQUuYwwRoHChfaAac+W
	OpPa3/fBzuUr0K+TdTd+fzZlHjYmpcT7WNLV4=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=message-id:date:from:reply-to:user-agent:mime-version:to:subject
	:references:in-reply-to:content-type:content-transfer-encoding;
	b=oNjwNh4RGnlImSAV7Y+6s84u7nOZ3psmMrwvk3urUToa9SVXFgKaPt/WukEBV233cK
	X3xTyhusgRoyWgUPSEQc/NKoTy60FCl+0I41Re5JTOrU0dU3OqBxCZfZPTUtuuGG9V49
	24nU6X2vA65VjxjCghh+38AD5sdJ3DzznpX38=
Received: by 10.142.107.5 with SMTP id f5mr3513212wfc.130.1237920974547;
	Tue, 24 Mar 2009 11:56:14 -0700 (PDT)
Received: from ?172.31.11.36? (mscitspubwlgw.wustl.edu [128.252.55.250])
	by mx.google.com with ESMTPS id 30sm9911492wfa.58.2009.03.24.11.56.12
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Tue, 24 Mar 2009 11:56:13 -0700 (PDT)
Message-ID: <49C92CC7.2080801@gmail.com>
Date: Tue, 24 Mar 2009 13:56:07 -0500
From: Junqian Gordon Xu <xjqian@gmail.com>
User-Agent: Mozilla-Thunderbird 2.0.0.19 (X11/20090103)
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <b6ebd0a50903171218i7f5716afifd99177982b6df5b@mail.gmail.com>	<b6ebd0a50903231335y1ddfcb3bpd447b646e18d439a@mail.gmail.com>	<1237885606.5348.8.camel@dax.rpnet.com>	<b6ebd0a50903240808p4e07c61g6a088df634e161b2@mail.gmail.com>
	<ac9c93b10903241136q779fe115sa595c31200b707c6@mail.gmail.com>
In-Reply-To: <ac9c93b10903241136q779fe115sa595c31200b707c6@mail.gmail.com>
Subject: Re: Package Maintenance
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
X-List-Received-Date: Tue, 24 Mar 2009 18:57:47 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 03/24/2009 01:36 PM, Frans Meulenbroeks wrote:
> Disadvantage of a Maintainers file is that it is yet another file to
> update when you create a package (adjacent to the checksums file and
> of course the package recipe). Guess it will be forgotten regularly.
> 
> Also I fear we're going to end up with a lot of orphaned packages.

One possibility is to get statistics about the committer from the last X 
commits, calculate the mean and standard deviation (STD) of the age of 
the last X commits to indicate how likely the maintainer is alive, and 
automatically update the Maintainer file every month. There will be 
other details to discuss, but the maintainer file would look something 
like this.

Recipe name	Maintainer	Mean Age (last 5)	STD (last 5)

gcc		Koen		2 month            	10 days
binutils        RP		1 year			2 month
...

Regards
Gordon


