Received: from [74.125.46.158] (helo=yw-out-1718.google.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <cliff.brake@gmail.com>) id 1M4ipV-0000xK-Kc
	for openembedded-devel@lists.openembedded.org;
	Thu, 14 May 2009 23:51:05 +0200
Received: by yw-out-1718.google.com with SMTP id 9so882475ywk.42
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 14 May 2009 14:44:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:in-reply-to:references
	:date:message-id:subject:from:to:content-type
	:content-transfer-encoding;
	bh=T/CgmG7LtUdgHRud6KYG4WfzHxPVu22m8ScHETtLFL4=;
	b=S7W3XbzBdowS0OuWJHL9+W5amGmCS+wuJ4onEpEW2urLT9a/tcIc01z7q/qMJNDdFs
	1QoV+luc+ufrDRjJJOlCVSthAe+ZtXP5LhjXYHah8MBcHMAmn1iTl7E/MF1sdg3JhHul
	q8OrkZqMXvOlIkhKyrXt8pUcuCBNg/Dk5stoU=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type:content-transfer-encoding;
	b=yBzhW5RffiCyDNHX0+WHMDSAXuWZAc181aPNAMdzKPw9YI5sKy9jrtTFxwT7qBxLOf
	Fvsd9MUAuH19eTrThZwpBej5A45jJUDJwnreQu1bWW2Ep8LAVOJEhTp7EClplpejXXfy
	Hn69jCulNhgb1eAGDW/4u2b8SfKsfmYdvVT2c=
MIME-Version: 1.0
Received: by 10.150.49.1 with SMTP id w1mr4469513ybw.323.1242337054761; Thu, 
	14 May 2009 14:37:34 -0700 (PDT)
In-Reply-To: <4A0B21AB.70602@balister.org>
References: <f96d234e0905131216o2111c9d8medac9b4450d5aaa@mail.gmail.com>
	<4A0B21AB.70602@balister.org>
Date: Thu, 14 May 2009 17:37:34 -0400
Message-ID: <f96d234e0905141437g211d48ffgc598c0f9e69beabe@mail.gmail.com>
From: Cliff Brake <cliff.brake@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: Re: OE git move to OSUOSL
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
X-List-Received-Date: Thu, 14 May 2009 21:51:06 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

While mapping this out, we discovered that the OE documentation is
pointing to git.oe.net, and cgit.oe.net instead of *.org.  Thus, we
are going to postpone the move until Wed (2009-05-14) to give people
time to switch their setups to *.org.  I'll be updating the
documentation shortly.

IMPORTANT, PLEASE READ!!!!

Please change your git workspaces to point to .org instead of .net.
One way to do this, is edit .git/config and change the URI.  There is
probably a "proper" way to do this.

Also, if you have any autobuilders, etc, please change those.

I apologise for the hassle, but it is difficult enough to schedule the
move just worrying about *.org, without having to coordinate the *.net
DNS changes as well.  We will likely be dropping the use of the *.net
URI's.

Thanks,
Cliff

On Wed, May 13, 2009 at 3:38 PM, Philip Balister <philip@balister.org> wrot=
e:
> Cliff Brake wrote:
>>
>> Hello,
>>
>> The oe git infrastructure is set up at OSUOSL, so I propose we move
>> git.oe.org, and cgit.oe.org this Fri @ 3PM. =A0I've cordinated the DNS
>> changes with Philip Balister. =A0You can test at:
>
> That is 3PM EDT. 1900 UTC :)
>
> Philip
>
>>
>> http://new.openembedded.org/cgit/
>>
>> and git URI's
>>
>> git://new.openembedded.org/openembedded
>> git@new.openembedded.org/openembedded
>>
>> Feel free to push changes or whatever to test, as I plan to re-rsync
>> the git repository from the current server right before the
>> switchover. =A0The OE git server may be unavailable for a couple hours
>> during the switchover, and DNS propagation.
>>
>> Thanks,
>> Cliff
>>
>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>
>



--=20
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Cliff Brake
http://bec-systems.com


