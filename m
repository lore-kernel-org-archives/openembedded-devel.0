Received: from [74.125.92.148] (helo=qw-out-1920.google.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <sakoman@gmail.com>) id 1MBhZu-0003yD-Pt
	for openembedded-devel@lists.openembedded.org;
	Wed, 03 Jun 2009 05:55:50 +0200
Received: by qw-out-1920.google.com with SMTP id 14so3479959qwa.36
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 02 Jun 2009 20:46:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:in-reply-to:references
	:date:message-id:subject:from:to:content-type
	:content-transfer-encoding;
	bh=ilQB/vsubAsgPdxOLDOa1ETV74zhTPL/WsGKcigXaPQ=;
	b=Rda7ZMfVcvaKpQguwWyfghdZaeWg1sAr0XEuqRGnz3ji9hBdyViP6wBv27h9n5n0/Z
	7HjmOK2sqpieyyBbGygPeFQQVb6OVhGnpGa+UTr8pQpTdmI0VNTyTotIQHnF/klfoLQw
	+apxaPHwAw6/A/6enWsZbOFoia+iDHj2K/rPY=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type:content-transfer-encoding;
	b=LdLAN/VNfzOBwtSAO6rIkfwqg6uraps9wA4EabaLOnYJffPs2+V7MR1zOxklvWzVxP
	detmQJUR9f+HYHKDvgSilic9+lK8sL5v9e/dK1OWkEInwZcJ812vEMl9M0FF1FfepiLr
	o0PvkYagEzBvM27ezx8CXV4PpGm58kF24LRyY=
MIME-Version: 1.0
Received: by 10.229.97.80 with SMTP id k16mr256016qcn.17.1244000815943; Tue, 
	02 Jun 2009 20:46:55 -0700 (PDT)
In-Reply-To: <h03dh4$c4q$1@ger.gmane.org>
References: <5e088bd90906020626m6f180330w61f7ab77391737da@mail.gmail.com>
	<h03dh4$c4q$1@ger.gmane.org>
Date: Tue, 2 Jun 2009 20:46:55 -0700
Message-ID: <5e088bd90906022046x36787d6dq1144528c968d9719@mail.gmail.com>
From: Steve Sakoman <sakoman@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: Re: guile-native (as well as a few others) failing after pull last night
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
X-List-Received-Date: Wed, 03 Jun 2009 03:55:51 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

On Tue, Jun 2, 2009 at 7:38 AM, Koen Kooi <k.kooi@student.utwente.nl> wrote=
:
> On 02-06-09 15:26, Steve Sakoman wrote:
>>
>> The failures are all in do_configure and seem quite similar (see log
>> below).
>>
>> I tried wiping tmp, same failure.
>>
>> I'm an autotools idiot :-( =A0Any suggestions?
>
>> | configure.in:795: error: possibly undefined macro: AM_GNU_GETTEXT
>
> That implies that gettext-native hasn't been staged yet.

Thanks Koen.

I added gettext-native to the DEPENDS list in the guile-native recipe
and the build continued successfully from that point.

Steve


