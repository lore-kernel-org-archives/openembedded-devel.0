Received: from mail-iy0-f175.google.com ([209.85.210.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <philippedeswert@gmail.com>) id 1Q5YlT-0004AR-PD
	for openembedded-devel@lists.openembedded.org;
	Fri, 01 Apr 2011 09:27:27 +0200
Received: by iye7 with SMTP id 7so3508397iye.6
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 01 Apr 2011 00:25:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:in-reply-to:references:date
	:message-id:subject:from:to:content-type:content-transfer-encoding;
	bh=gvR02FDmrL2mI2u4u/3rKpiY1RyJxsZt2o7IzZAfqBM=;
	b=O5cakGJ6YtPZ335yWg4sYfr6sPeD7EhOi87Nvpr5pY2ffDW+epmY2YUO4m2w6ZxQcx
	MvD/5nLLfkLE96dwENqJH3oVsGTfMhu1fMuGfqZpQyli1zJdBVDVdh0EEQ2j665DWdu8
	uBlz5p3bpSwV6xnoyXpUN1MAGBJJXewJHZwqw=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type:content-transfer-encoding;
	b=C5y7cJuyoDLe3KFINwFgJsmVLNsqR5v/GbDSBQ5obIQZGteX4Fw9PTVsW4+3jE7waV
	x+gUExcWHHGE0VbTcqIZp2Um0pVEkIQNzdB9pGpD0krV1roSfR3BBVHT1CreQbuhhcAs
	hWfzHdadwgBHorhQ+zOG6HQ8kpJ0ERrG4vJ4M=
MIME-Version: 1.0
Received: by 10.43.58.12 with SMTP id wi12mr4327837icb.309.1301642722800; Fri,
	01 Apr 2011 00:25:22 -0700 (PDT)
Received: by 10.43.131.199 with HTTP; Fri, 1 Apr 2011 00:25:22 -0700 (PDT)
In-Reply-To: <1301602980.3988.18.camel@mattotaupa>
References: <1301600399-32041-1-git-send-email-philippedeswert@gmail.com>
	<1301602980.3988.18.camel@mattotaupa>
Date: Fri, 1 Apr 2011 10:25:22 +0300
Message-ID: <AANLkTikL73GsmeB8pqSGMPjD972MhjsCOE+reTLKjxk+@mail.gmail.com>
From: Philippe De Swert <philippedeswert@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: Re: [PATCH [1/2]] eio: New recipe for eio
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
X-List-Received-Date: Fri, 01 Apr 2011 07:27:28 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

Hi Paul,

Thanks for the review.

On 31 March 2011 23:23, Paul Menzel <paulepanter@users.sourceforge.net> wro=
te:
> Am Donnerstag, den 31.03.2011, 22:39 +0300 schrieb Philippe De Swert:
>
> =BBeio: add initial recipe (svn)=AB =A0or something like that would be a
> better commit summary in my opinion.

I'll keep that in mind

>> +
>> +# Some upgrade path tweaking
>> +AUTO_LIBNAME_PKGS =3D ""
>
> What upgrade patch?

Yeah I should have double checked that... Just put it there as all the
other enlightenment
.inc files had it.

>> diff --git a/recipes/efl1/eio_svn.bb b/recipes/efl1/eio_svn.bb
>> new file mode 100644
>> index 0000000..6a12dcf
>> --- /dev/null
>> +++ b/recipes/efl1/eio_svn.bb
>> @@ -0,0 +1,13 @@
>> +require eio.inc
>> +
>> +SRCREV =3D "${EFL_SRCREV}"
>> +PV =3D "0.1.0+svnr${SRCPV}"
>> +PR =3D "${INC_PR}.0"
>> +DEFAULT_PREFERENCE =3D "-1"
>
> It is the only recipe, so `DP =3D "-1"` should not be useful.

Just wanted to be future proof for when the actual versioned recipes come.

Cheers,

Philippe


