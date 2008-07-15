Received: from [74.125.92.150] (helo=qw-out-1920.google.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <shawn.t.rutledge@gmail.com>) id 1KIoPF-0001jp-Lo
	for openembedded-devel@lists.openembedded.org;
	Tue, 15 Jul 2008 19:33:41 +0200
Received: by qw-out-1920.google.com with SMTP id 9so214596qwj.36
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 15 Jul 2008 10:33:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:message-id:date:from:to
	:subject:in-reply-to:mime-version:content-type
	:content-transfer-encoding:content-disposition:references;
	bh=IVskBOA5fbz51vLirzS4KH1l5vjK2/d8MZUeSTBP/PY=;
	b=DBfWcCZgm9/8K40niPqgXoPZjIWAYW/13+tt3fyg7u0p+CncSSPjLGOdL694UEp1a6
	9b9I7R5qk5zsKfHUFw4XyBQQcaA/gueR9cmX0tVUk7b8kgIjyjtbxItVWlRJyXdAHZvU
	wHqB2s4cOXGZNnjNV3HdhjMDxXHsAe8PQ8tA0=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=message-id:date:from:to:subject:in-reply-to:mime-version
	:content-type:content-transfer-encoding:content-disposition
	:references;
	b=tdxMLRz6jO6/bOcnl3QU9USRx9qCf3enmQv3MSC9UwqmpR1DuUH6WtFDLCqvQqjgJ1
	w7uek8heXtvKg80MyiNNBYY3COQnpw0xONcXVQYATF2V8I1l9yusH8PXGt+2kYw1jBpv
	QXq9qwIeHKpl8WSHMzcbtYUBABTVt0MXUyTEc=
Received: by 10.150.144.9 with SMTP id r9mr628110ybd.122.1216143184566;
	Tue, 15 Jul 2008 10:33:04 -0700 (PDT)
Received: by 10.150.189.11 with HTTP; Tue, 15 Jul 2008 10:33:04 -0700 (PDT)
Message-ID: <d9a6586e0807151033h46763394y622641365568c8a9@mail.gmail.com>
Date: Tue, 15 Jul 2008 10:33:04 -0700
From: "Shawn Rutledge" <shawn.t.rutledge@gmail.com>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <g5i16r$tb9$1@ger.gmane.org>
MIME-Version: 1.0
References: <d9a6586e0807150126w6ceb8a0aj5a5b6bab4cb42cfc@mail.gmail.com>
	<g5i16r$tb9$1@ger.gmane.org>
Subject: Re: help with bitbake recipe
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.10
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
X-List-Received-Date: Tue, 15 Jul 2008 17:33:41 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

On Tue, Jul 15, 2008 at 4:20 AM, Koen Kooi <k.kooi@student.utwente.nl> wrote:
> Try altering FILES_${PN}, since that gets packages before ${PN}-doc

So does it subtract the files it found in FILES_${PN} from being
available for the following packages?

> bitbake -b chicken_3.3.0.bb -c install -f ; bitbake -b chicken_3.3.0.bb -c
> package_write

Thanks.


