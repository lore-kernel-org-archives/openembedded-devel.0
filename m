Received: from mail-pv0-f175.google.com ([74.125.83.175])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <raj.khem@gmail.com>) id 1OtM5s-0002dA-3b
	for openembedded-devel@lists.openembedded.org;
	Wed, 08 Sep 2010 16:57:54 +0200
Received: by pvg6 with SMTP id 6so57941pvg.6
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 08 Sep 2010 07:57:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:mime-version:received:in-reply-to
	:references:from:date:message-id:subject:to:content-type
	:content-transfer-encoding;
	bh=AJGm4KreY67//Q4GuABbatu3Ax7BE4x5NJWDwaUar7k=;
	b=DKfy1wm8mTmX3isPhcjWuco2kKI/UQykqq9sc5TSr/D879QMI5niIbBtoLWTLzNYjf
	qlaefCsMWbVWCf+fRFwfUFUG7lTXT4B0GLjYBFxmGrzpcu/UnUm9biHb0IYCbFzZqpz3
	9pX9Dde4JD6Zr/KBagtI6nflRgo3eQBw6I8D0=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:content-type:content-transfer-encoding;
	b=dE4tOYiaiiLHsw94aK8e0M7UxPO7AZXwWRa091Ii2Y9JU9NkETh3R/2g3ABYXxHHiP
	lg3CA8+O1pBb11OabIbfWoKQSv0U4d+FIHUuf2wvibJ5sA1uCDUGfAog8UqkkuDQ4G2w
	7aREsVPDiBZ6RoyczvqUQDk22PvtadYbP/moc=
Received: by 10.114.111.15 with SMTP id j15mr87494wac.119.1283957823979; Wed,
	08 Sep 2010 07:57:03 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.231.205.134 with HTTP; Wed, 8 Sep 2010 07:56:43 -0700 (PDT)
In-Reply-To: <1283925467.17152.1.camel@pkl-fusman-ubuntu>
References: <1283842952-20249-1-git-send-email-raj.khem@gmail.com>
	<1283925467.17152.1.camel@pkl-fusman-ubuntu>
From: Khem Raj <raj.khem@gmail.com>
Date: Wed, 8 Sep 2010 07:56:43 -0700
Message-ID: <AANLkTi=rudmjsFvYs32RrwZ-KfRiOmUtNsXq9Vn8FS0x@mail.gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 74.125.83.175
X-SA-Exim-Mail-From: raj.khem@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: [PATCH 1/2] java-library.bbclass: do_stage is not needed anymore
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
X-List-Received-Date: Wed, 08 Sep 2010 14:57:58 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

On Tue, Sep 7, 2010 at 10:57 PM, Fahad <Fahad_Usman@mentor.com> wrote:
> On Tue, 2010-09-07 at 00:02 -0700, Khem Raj wrote:
>> Signed-off-by: Khem Raj <raj.khem@gmail.com>
>> ---
>> =A0classes/java-library.bbclass | =A0 =A04 ----
>> =A01 files changed, 0 insertions(+), 4 deletions(-)
>>
>> diff --git a/classes/java-library.bbclass b/classes/java-library.bbclass
>> index 904b4f1..5ce0537 100644
>> --- a/classes/java-library.bbclass
>> +++ b/classes/java-library.bbclass
>> @@ -65,7 +65,3 @@ do_install() {
>> =A0java_stage() {
>> =A0 =A0oe_jarinstall -s ${JARFILENAME} ${ALTJARFILENAMES}
>> =A0}
> Shouldn't you remove this java_stage function as well, as it won't be
> called anymore.

its still used in do_install. but yes there can be some cleanup done
there. I did
minimum to fix it.
>> -
>> -do_stage() {
>> - =A0java_stage
>> -}
>
>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>


