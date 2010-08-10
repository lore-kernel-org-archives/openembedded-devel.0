Received: from mail-bw0-f47.google.com ([209.85.214.47])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <graham.gower@gmail.com>) id 1OiyV1-0006Sn-JJ
	for openembedded-devel@lists.openembedded.org;
	Wed, 11 Aug 2010 01:44:54 +0200
Received: by bwz8 with SMTP id 8so2363035bwz.6
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 10 Aug 2010 16:44:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:received:in-reply-to
	:references:date:message-id:subject:from:to:content-type
	:content-transfer-encoding;
	bh=4jfmQC21MeNGOb9HdQFk4xONJRI4ikQvxmNJ1mKDeNA=;
	b=NcMswH1jQ5IB3Cn88mYwGeUBoDpdb4HLAd1y6rVJv66UYQu17P/SsvkfhkOI77zo5b
	JLpr007QIDF1n/Swas5lXJGGuDYRKvqwVIHYpqAhaE6tmdK5xeVIXN48GkzjNjDky/h8
	fee8VKGTYzxUw/cZNDAGxc1ACqQTMYl7T55nQ=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type:content-transfer-encoding;
	b=hC2OJca/lvOiiTclbTKHYnKF/6IvALTo9LipTEXbhtfSnwCgQOpqQCdx0h+H+8XtPJ
	8+F0Hq+nhdB6ihFpmz+pv1JVzVNICDfPQFxffNftSIJgBNraN9AMAm+EGkxe9kelT0/3
	cY51PgzRTJQvv89fq+aeuU58iupizhkgccpvg=
MIME-Version: 1.0
Received: by 10.204.25.145 with SMTP id z17mr4685121bkb.104.1281483881711; 
	Tue, 10 Aug 2010 16:44:41 -0700 (PDT)
Received: by 10.204.152.212 with HTTP; Tue, 10 Aug 2010 16:44:41 -0700 (PDT)
In-Reply-To: <AANLkTikUdG4hRo1wJmObU1g5fomeuViCirSBsVFCEYYZ@mail.gmail.com>
References: <0B51A1E7C61D114DAE6FC10B0FD0ABA5018B5E82@deimsg40.de.net.world>
	<AANLkTinK5O3F25QJ40B8+rt5M57BKwWVOYytUEZqvP-D@mail.gmail.com>
	<AANLkTikjcrh78MDsSbdALEWbZGHU7nwrk14FQFiU=ynA@mail.gmail.com>
	<AANLkTimbjUYY22nf59gPAw-Xm05mMLNdDA61Ydc63DFs@mail.gmail.com>
	<i3se2n$gj7$1@dough.gmane.org>
	<AANLkTikUdG4hRo1wJmObU1g5fomeuViCirSBsVFCEYYZ@mail.gmail.com>
Date: Wed, 11 Aug 2010 09:14:41 +0930
Message-ID: <AANLkTinkuGZVYFHL7N6GwM5BftTr-+L4BP7-jwsRZzqL@mail.gmail.com>
From: Graham Gower <graham.gower@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.214.47
X-SA-Exim-Mail-From: graham.gower@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: Why PREFERRED_VERSION setting of <distro>.conf overrules local.conf setting ?
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
X-List-Received-Date: Tue, 10 Aug 2010 23:44:54 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

On 11 August 2010 06:26, Chris Larson <clarson@kergoth.com> wrote:
> On Tue, Aug 10, 2010 at 1:50 PM, Koen Kooi <k.kooi@student.utwente.nl>wro=
te:
>> What's the point of setting a preferred version at all if you make it a
>> weak assignment?
>> The distro nearly always knows better and if you want to use a different
>> version, sending a patch to change that version for review isn't exactly
>> rocket science.
>
>
> How about having decent usability? =A0The user asking for something and n=
ot
> getting it is completely unintuitive. =A0If the user doesn't know what th=
ey
> want, they won't request a specific version. =A0If they do request it, th=
ey
> should get it, anything else is an OE usability issue.

Precisely. The user shouldn't have to understand the details of
parsing order, weak assignments, etc. in order to write a local.conf
which works for them.

Patch to follow.

-Graham


