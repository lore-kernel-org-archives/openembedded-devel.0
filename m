Received: from mail-ie0-f175.google.com ([209.85.223.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <s.stirtzel@googlemail.com>) id 1TOPD3-00082J-GC
	for openembedded-devel@lists.openembedded.org;
	Wed, 17 Oct 2012 10:42:37 +0200
Received: by mail-ie0-f175.google.com with SMTP id c13so11300901ieb.6
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 17 Oct 2012 01:29:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type; bh=V0zfzWt7lPLN/w26UtAqKbJkwgm1nNXJyHjLGAT7V74=;
	b=ff6El56USSRYLRa1FZ8FqfhcaZBaSLfi+fuOy8Q8HycJePZpc+FwhCIqZaJtSDOSvb
	+SeWtCnhKtC11vfPMwy0XWp0FCIwz7tKE6JTJOLGuS1jkSEIqJczY4GI8FF185ie+QR/
	PrDuwHy6H/FhBv0f8LNRjk7vdMhdzjm0OKYfiU4SmyeXszZiULIsYPhq7w1b9BgOubfe
	ljeUzFMW6yKh711/PS9ugG3QOoFMdNcXaJbNXD4q4rrUhmOqLeH5ikdn6NmYftCv7Uxn
	MTGpNr2hCrEHqgXX7/2S6pPO6m/ArmyJk1MGoB4CUsyFFB8y07C5D/NFh8Lfm+cgcU6l
	s8Gw==
MIME-Version: 1.0
Received: by 10.50.135.38 with SMTP id pp6mr823790igb.36.1350462556920; Wed,
	17 Oct 2012 01:29:16 -0700 (PDT)
Received: by 10.64.24.179 with HTTP; Wed, 17 Oct 2012 01:29:16 -0700 (PDT)
In-Reply-To: <CAP9ODKrNWnk_H0GjfM6sP8KNApRr=bGT0YaSEXp-8qMNq_GfZQ@mail.gmail.com>
References: <1349166535-14325-1-git-send-email-s.stirtzel@googlemail.com>
	<CAP9ODKrNWnk_H0GjfM6sP8KNApRr=bGT0YaSEXp-8qMNq_GfZQ@mail.gmail.com>
Date: Wed, 17 Oct 2012 10:29:16 +0200
Message-ID: <CAGiJk9d+OabH=fROOS6Y8w-GNs8STaYgFVCBLZisKv2VDAd7JA@mail.gmail.com>
From: Samuel Stirtzel <s.stirtzel@googlemail.com>
To: openembedded-devel@lists.openembedded.org
Subject: Re: [PATCH] Maliit: Add initial recipes
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
X-List-Received-Date: Wed, 17 Oct 2012 08:42:37 -0000
Content-Type: text/plain; charset=UTF-8

2012/10/16 Otavio Salvador <otavio@ossystems.com.br>:
> On Tue, Oct 2, 2012 at 5:28 AM, Samuel Stirtzel
> <s.stirtzel@googlemail.com> wrote:
>> Maliit is a Qt based virtual keyboard under liberal license (LGPLv2.1 / BSD)
>> The inputmethod framework from Qt is used and it supports gtk-immodules.
>> It can also be used without dependencies to GTK+ (separate package for GTK+)
>>
>> Signed-off-by: Samuel Stirtzel <s.stirtzel@googlemail.com>
>
> Thanks by working on this. Bellow my comments ...
>
> ...
>> diff --git a/meta-oe/recipes-support/maliit/maliit-framework_git.bb b/meta-oe/recipes-support/maliit/maliit-framework_git.bb
>> new file mode 100644
>> index 0000000..3f50d1b
>> --- /dev/null
>> +++ b/meta-oe/recipes-support/maliit/maliit-framework_git.bb
> ...
>> +
>> +# Maliit needs Qt configured with -accessibility, a patch for that was already sent and will get merged in post 1.2.
>> +RDEPENDS_${PN} = "qt4-plugin-inputmethod-imsw-multi libqtsvg4"
>
> In this case, maliit is a post 1.2 package.
>
> ...
>> +EXTRA_QMAKEVARS_PRE = "\
>> +    PREFIX=${prefix} \
>> +    LIBDIR=${libdir} \
>> +    QT_IM_PLUGIN_PATH=${libdir}/qt4/plugins/inputmethods \
>> +    MALIIT_INSTALL_PRF=${datadir}/qt4/mkspecs/features \
>> +    SCHEMADIR=${sysconfdir}/gconf/schemas \
>> +    CONFIG+=disable-gconf \
>> +    CONFIG+=disable-gtk-cache-update \
>> +    CONFIG+=local-install \
>> +    "
>
> Really need to disable gtk-cache-update? Why?

This option is for packaging, it disables running gtk-query-immodules
on the build-host

>
> ...
>> +# Update the inputmethod modules in gtk
>> +pkg_postinst_${PN}-gtk() {
>> +if [ "x$D" != "x" ]; then
>> +    exit 1
>> +fi
>> +gtk-query-immodules-2.0 > /etc/gtk-2.0/gtk.immodules
>> +}
>> +
>> +pkg_postrm_${PN}-gtk() {
>> +if [ "x$D" != "x" ]; then
>> +    exit 1
>> +fi
>> +gtk-query-immodules-2.0 > /etc/gtk-2.0/gtk.immodules
>> +}
>
> You might add a gtk-immodules.bbclass to allow it to be put out of the recipe.

FYI: I have a class for this, but the only other recipe using
gtk-query-immodules is
openembedded-core/meta/recipes-sato/matchbox-keyboard/matchbox-keyboard_git.bb
Should I send a patch with the .bbclass to oe-core?

>
> As said by Martin, please read the README and follow the steps to send
> the patch...

Seems to be a classic case of -ENOCOFFEEYET

Will re-send with the right prefix


-- 
Regards
Samuel


