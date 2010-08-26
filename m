Received: from mail-iw0-f175.google.com ([209.85.214.175])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <raj.khem@gmail.com>) id 1OokgD-0001GJ-Cg
	for openembedded-devel@lists.openembedded.org;
	Fri, 27 Aug 2010 00:13:48 +0200
Received: by iwn2 with SMTP id 2so1867860iwn.6
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 26 Aug 2010 15:11:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:mime-version:received:in-reply-to
	:references:from:date:message-id:subject:to:content-type
	:content-transfer-encoding;
	bh=NqWXOppOiZEG28M0jqgEa09mnNWKjv09IW6II3m7HGE=;
	b=fZV42Ibq/s2lsdkYVT24GnvuHmYyXZy1R/PyNe1qSr6sTtqVERDQrwtJjk1t0iXJ8t
	eIbqEzOSaOxc+bzevJOcA6DslvobLNTV/iBbBERIuAv/WzHF2r4xB99DeHU1/qoTqOrZ
	uLTQ9hFaX3PWjonbLddPnUWJPvJOtA+05bSxc=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:content-type:content-transfer-encoding;
	b=RRN3404UCR9iuxTVt8jwARbidZBS9s65Cl92doARr/j5gZ9Hp98iIYt3XBiVB+pXQs
	Sh/SJymOTFPH8IUH6jZ+Cugyug70PZ0PX080huyBsp78YeCtUGroFxTrWywoLXlk6J+x
	Bc4F5KdaTp3h3eZYV0Q4rz+Z8UF/PJIamXi9U=
Received: by 10.231.155.212 with SMTP id t20mr12564103ibw.37.1282857026310;
	Thu, 26 Aug 2010 14:10:26 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.231.207.8 with HTTP; Thu, 26 Aug 2010 14:10:06 -0700 (PDT)
In-Reply-To: <AANLkTi=TUw1VshDF5Gg0Ki_WDQGR3iy+QOAu4W3jeRhy@mail.gmail.com>
References: <AANLkTinGpZfVnPea6ZCcs+UxePXkRAkT6BDpxaNQezGU@mail.gmail.com>
	<AANLkTi=TUw1VshDF5Gg0Ki_WDQGR3iy+QOAu4W3jeRhy@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Thu, 26 Aug 2010 14:10:06 -0700
Message-ID: <AANLkTi==cLFtnSeuz8i6UA8TGkFe2=o2XQWEjXiDgXx4@mail.gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.214.175
X-SA-Exim-Mail-From: raj.khem@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: hildon-lgpl in nonworking but appears in DEPENDS in recipes
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
X-List-Received-Date: Thu, 26 Aug 2010 22:13:56 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

On Thu, Aug 26, 2010 at 12:34 PM, Frans Meulenbroeks
<fransmeulenbroeks@gmail.com> wrote:
> 2010/8/26 Khem Raj <raj.khem@gmail.com>:
>> Hi,
>>
>> hildon was moved to nonworking recipes but there are recipes which
>> DEPEND on this.
>>
>> gpe-mini-browser/gpe-mini-browser-hildon_0.16.bb:DEPENDS =A0 =A0 =A0=3D
>> "osb-nrcit libosso hildon-lgpl hildon-fm libgpewidget"
>> gpe-mini-browser/gpe-mini-browser-hildon_0.15.bb:DEPENDS =A0 =A0 =A0=3D
>> "osb-nrcit libosso hildon-lgpl hildon-fm libgpewidget"
>> gpe-mini-browser/gpe-mini-browser-hildon_0.17.bb:DEPENDS =A0 =A0 =A0=3D
>> "osb-nrcit libosso hildon-lgpl hildon-fm libgpewidget"
>> libgpepimc/libgpepimc-hildon_0.5.bb:DEPENDS =A0 =A0 =3D "libgpewidget-hi=
ldon
>> gtk+ sqlite hildon-lgpl"
>> maemo/hildon-status-bar_0.8.11-1.bb:DEPENDS =3D "hildon-lgpl libosso hil=
don-libs"
>> maemo/hildon-control-panel_0.9.1-1.2.bb:DEPENDS =3D "hildon-lgpl
>> hildon-base-lib osso-af-settings libosso hildon-libs osso-af-settings
>> libosso-help"
>> maemo/libosso-help_1.0.01.bb:DEPENDS =3D =A0"libosso hildon-lgpl
>> hildon-base-lib hildon-libs"
>> maemo/osso-application-installer_1.0.03-1.bb:DEPENDS =3D "hildon-lgpl
>> hildon-base-lib libosso hildon-libs hildon-control-panel
>> shared-mime-info"
>> tasks/task-maemo.bb: =A0 =A0hildon-lgpl
>>
>> I am tempted to move them to nonworking as well. opinions ?
>
> I agree that it is pointless to keep them if they do not build so
> moving them to nonworking is imho quite logical and therefore has my
> blessing.
>
> However, while you're at it there is more to be moved as there are
> recipes which depend on the ones you propose to move:
> dependencies on libgpepimc-hildon
> gpe-todo/gpe-todo-hildon_0.54.bb:DEPENDS =A0 =A0 =3D "libgpewidget-hildon
> libgpepimc-hildon libtododb sdk-default-icons libosso"
> gpe-todo/gpe-todo-hildon_0.55.bb:DEPENDS =A0 =A0 =3D "libgpewidget-hildon
> libgpepimc-hildon libtododb sdk-default-icons libosso"
> :
> dependencies on libosso-help:
> maemo-mapper/maemo-mapper_svn.bb:DEPENDS =3D "gdbm libconic sqlite3 gtk+
> libhildonfm libosso osso-ic-oss libosso-help gnome-vfs dbus
> bluez-libs"
> maemo/hildon-control-panel_0.9.1-1.2.bb:DEPENDS =3D "hildon-lgpl
> hildon-base-lib osso-af-settings libosso hildon-libs osso-af-settings
> libosso-help"
>

thanks. Yes I will move them one after another.

> I haven't checked for the non-lib recipes, might be some additonal deps t=
oo.
>
> Frans
>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>


