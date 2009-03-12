Received: from [209.85.220.167] (helo=mail-fx0-f167.google.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <fransmeulenbroeks@gmail.com>) id 1Lhhb0-0005X5-Uf
	for openembedded-devel@lists.openembedded.org;
	Thu, 12 Mar 2009 10:52:58 +0100
Received: by fxm11 with SMTP id 11so300472fxm.12
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 12 Mar 2009 02:52:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:date:message-id:subject
	:from:to:content-type:content-transfer-encoding;
	bh=iZduZSuerOkWsiWM49+jIRmwbKRBIKYq3uQCc/xYfAo=;
	b=sePAWyfxrVXe3ZhsnKb152M6E72SC+hYtyrzHKwtp66Ia9/ojhhRJwoIwalP/1ZwcK
	naLPNpC3DHVVDKZ6Cbm3h6cuHYSOZrkHQh24EiwQnnagU+2r5xEmT/6gcAIgya0Rscch
	gAUlo1KbsHeiXkY97PqZiBk4bjZGoIsOexwq8=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:date:message-id:subject:from:to:content-type
	:content-transfer-encoding;
	b=VSvqWvJxin3Q3RRDeNxtl2rhQOt6B9+wROzLvjttzlbUnspQnhcQ33Se/GkFqx3UGg
	bKtHAxaldXbvbZaQK0aVMrAKNPPrJ/3HxD90uzUNTPsNymfEe+B1RV2A/R6qj7ag/eW+
	MCXggC8NE/ZtVtSQ8I86H2irNVVKGDuE0Q0I0=
MIME-Version: 1.0
Received: by 10.223.105.9 with SMTP id r9mr7146290fao.66.1236851565071; Thu, 
	12 Mar 2009 02:52:45 -0700 (PDT)
Date: Thu, 12 Mar 2009 10:52:45 +0100
Message-ID: <ac9c93b10903120252x292ff544gca18ac8684ce0f2f@mail.gmail.com>
From: Frans Meulenbroeks <fransmeulenbroeks@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: g++ lib problem
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
X-List-Received-Date: Thu, 12 Mar 2009 09:52:59 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit

Hi,

I was trying to port a program that used asinl etc. but apparently
asinl is not in our env.
However if I look at
~/oe/tmp/staging/armv7a-angstrom-linux-gnueabi/usr/include/c++/cmath I
see around line 123

  inline long double
  asin(long double __x)
  { return __builtin_asinl(__x); }

questions:
shouldn't this have been a double asin? (probably not too important as
the result will be casted)
and if asin is long double, then why is there no asinl?
normally it is

double asin(double x);
long double asinl(long double x);

guess this is something in the way our libs are generated, but I could
not find the proper way to fix it.

Anyone a suggestion?

Frans.


