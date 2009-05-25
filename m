Received: from [209.85.220.172] (helo=mail-fx0-f172.google.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <ihar.hrachyshka@gmail.com>) id 1M8VgQ-0000ga-FM
	for openembedded-devel@lists.openembedded.org;
	Mon, 25 May 2009 10:37:24 +0200
Received: by fxm20 with SMTP id 20so2971056fxm.12
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 25 May 2009 01:29:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:in-reply-to:references
	:date:message-id:subject:from:to:content-type
	:content-transfer-encoding;
	bh=Qg7G71lDGgUK3UaJ3HcVxGOHze20opBmPKcF0ZS57ks=;
	b=nk1geIEMzvcFHxO8fPlrVDFsmh3DCr08YAz+xiRJLBQwG1Aiyiz2tsWgKSVZL8rvft
	+dhB2mnByWifNy6bJFBX9BNpv3f++w5sT7MujT1lXFvgVUVDF6qJVltHeZh3MW25qqnL
	AD0krk0sQpWn6iLNjPHe1rutFOf4Fm0qjCJY8=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type:content-transfer-encoding;
	b=AA4LPvFeAGNDbujsjN7XzJZurF0y5mfcsosW10omJ8TZYD0k6LetvWgZJ6XxpqGPap
	7a2Yfl81/jHG+VCoep3/RWPfPQ8WdPV05CpNhz2s+JR9nQ5mpPRnlARExqEz9L4dO+Ld
	zRkP1RiDpjnNnljRzbT+BIhOaQ7neGs00DN+E=
MIME-Version: 1.0
Received: by 10.103.213.10 with SMTP id p10mr3531410muq.17.1243240161996; Mon, 
	25 May 2009 01:29:21 -0700 (PDT)
In-Reply-To: <5c5e5c350905250106v6d1c4be4laebb4517abbc44ac@mail.gmail.com>
References: <1242288896-6347-1-git-send-email-elena.valhalla@gmail.com>
	<1243164722.4226.129.camel@lenovo.internal.reciva.com>
	<5c5e5c350905250106v6d1c4be4laebb4517abbc44ac@mail.gmail.com>
Date: Mon, 25 May 2009 11:29:21 +0300
Message-ID: <fce2a370905250129h7332e0ecob22f0901c2b5b14a@mail.gmail.com>
From: Ihar Hrachyshka <ihar.hrachyshka@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: Re: Add gtksourceview 2.x and rename the 1.x tree recipe
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
X-List-Received-Date: Mon, 25 May 2009 08:37:41 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Mon, May 25, 2009 at 11:06 AM, Elena of Valhalla
<elena.valhalla@gmail.com> wrote:
> On Sun, May 24, 2009 at 1:32 PM, Phil Blundell <philb@gnu.org> wrote:
>> On Thu, 2009-05-14 at 10:14 +0200, Elena Grandi wrote:
>>> GtkSourceView[1] currently maintains a stable 2.x tree and an old stabl=
e
>>> 1.x tree for compatibility with older applications[2] and they can be
>>> installed together on a computer.[...]
>> Is there really any need to rename the old one? =C2=A0It seems like it w=
ould
>> be better just to leave the existing gtksourceview alone and add the new
>> one as gtksourceview2 or some such.
>
> no, there is no real need, except for the fact that now it would be
> easy to do so, while in the future it could became problematic as new
> recipes are added

The problem is that some users with overlays in their setups can use
an old name of package externally. If you really don't need to break
such things it's better to leave name as-is.

>
> for my needs adding gtksourceview2 is good enough
>
> --
> Elena ``of Valhalla''
>
> email: elena.valhalla@gmail.com
>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>


