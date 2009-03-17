Received: from [209.85.217.170] (helo=mail-gx0-f170.google.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <kergoth@gmail.com>) id 1Ljf2f-0007Uo-0S
	for openembedded-devel@lists.openembedded.org;
	Tue, 17 Mar 2009 20:33:40 +0100
Received: by gxk18 with SMTP id 18so78649gxk.12
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 17 Mar 2009 12:32:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:sender:received:in-reply-to
	:references:date:x-google-sender-auth:message-id:subject:from:to
	:content-type:content-transfer-encoding;
	bh=/Q5KHKJ7nOyjD51eB9fafEe43ty2QDEvY1cXYMJ3wnw=;
	b=t3bKjWSo9cJbCIlxEBUY3b9BXI1Z+0WP1znlnawr6WKZ1ftdib7mJn5WrrJEjPhjcW
	2hTWYLpfrzjx/JXXHircq06Js9AuqFVlU4paAxgrDwybYnzH0IkgBjrNnRk0FdXWYyCH
	B1hLTIK0lH9QZsF+fHTMmQtrjxwq+rZpk8sXQ=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:sender:in-reply-to:references:date
	:x-google-sender-auth:message-id:subject:from:to:content-type
	:content-transfer-encoding;
	b=DXy1brD/u0WN3Q+yiKMrIZcpKCAu/ynAAqfgpgjTa/9i92qSoBwH5Qrc67RUDLFY5Z
	pWmossggxei39Ix6D+UrfVEMTQ6kYhf0TkemqW2/UtrCeZbD4673kc+JgyuEnRmeiIJN
	O22gRkvQmClJQaMnHV2lxMOsOv+S/Z9rBBJ14=
MIME-Version: 1.0
Sender: kergoth@gmail.com
Received: by 10.150.140.6 with SMTP id n6mr620242ybd.248.1237318368801; Tue, 
	17 Mar 2009 12:32:48 -0700 (PDT)
In-Reply-To: <gpoter$l42$1@ger.gmane.org>
References: <b6ebd0a50903171218i7f5716afifd99177982b6df5b@mail.gmail.com>
	<gpoter$l42$1@ger.gmane.org>
Date: Tue, 17 Mar 2009 12:32:48 -0700
X-Google-Sender-Auth: 4413c0106632350a
Message-ID: <b6ebd0a50903171232x3692b874m28ac521ccc4be6f2@mail.gmail.com>
From: Chris Larson <clarson@kergoth.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.217.170
X-SA-Exim-Mail-From: kergoth@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on serenity
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=5.0 tests=BAYES_00,RDNS_NONE,SPF_PASS
	autolearn=no version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:14:11 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
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
X-List-Received-Date: Tue, 17 Mar 2009 19:33:40 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Tue, Mar 17, 2009 at 12:25 PM, Koen Kooi <k.kooi@student.utwente.nl> wro=
te:
> On 17-03-09 20:18, Chris Larson wrote:
>>
>> I'd like to propose re-establishing MAINTAINER, set per package, to
>> individuals, or left as default for packages which aren't directly
>> maintained.
>>
>> Doing this would:
>> - Facilitate dumping a list of unmaintained packages to give to new
>> users wanting to volunteer to help us, but not knowing how to
>> contribute.
>> - Return some individual responsibility to the project, giving one
>> person the blame for brokenness for that package, as well as giving
>> responsibility for pushing patches upstream to that person. =C2=A0In my
>> opinion, a number of the recent issues in the project are due, in
>> part, to a lack of that individual responsibility. =C2=A0Everything is
>> fuzzy, determined by a group, instead.
>> - Allow us to physically separate, in the repository, those packages
>> which get the most attention (are maintained) from those which get the
>> least (maintained by the entire team). =C2=A0We could finally be *honest=
*
>> with our users about what we work on, telling them that the packages
>> which are maintained by the team are in need of an individual
>> maintainer, and get less attention, so bugs there will be fixed more
>> slowly, and there are no guarantees on functionality there. =C2=A0I thin=
k
>> it'd be better to have a core set of *functional* recipes than have a
>> huge set of "might work, might not" recipes as things stand today. =C2=
=A0In
>> my opinion, this would be more likely to give new users stability than
>> creating a stable branch, while making better use of our limited
>> manpower, rather than increasing the load drastically.
>>
>> Opinions?
>
> As long as it doesn't get put in resulting packages in any way, it's fine=
 by
> me.

Good point, I don't think anyone wants to get emails from people who
found the MAINTAINER contact info in ipk files in feeds via google :)
--=20
Chris Larson
clarson at kergoth dot com
clarson at mvista dot com
Founder - BitBake, OpenEmbedded, OpenZaurus
Maintainer - Tslib
Software Engineer
MontaVista Software, Inc.


