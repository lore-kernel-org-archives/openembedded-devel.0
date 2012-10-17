Received: from mail-ie0-f175.google.com ([209.85.223.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <s.stirtzel@googlemail.com>) id 1TOSBd-0007OI-4F
	for openembedded-devel@lists.openembedded.org;
	Wed, 17 Oct 2012 13:53:21 +0200
Received: by mail-ie0-f175.google.com with SMTP id c13so11506690ieb.6
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 17 Oct 2012 04:40:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type; bh=wKRqxtGHXXq6JVF9TC58G/R3ZntPfC8ppSlEXJE9ICE=;
	b=i1aym8Bx9dWzcF2+ta4cd5LGenWQZkHI0+sIVg4OC7lqLR8igmfYL10LYDcfCJxFPy
	Mki3ePzxNJKxeoPSE2HtBsKCmN0DGjr26fFaozznNwAoibO3Mr3Zhs2hNEstGP595+eW
	SsWbhGVwPJkGhYNyhKMUh4UdwhGdWjwh9J7GBGCr9TNkEESyV5SPysaThtIC3nCuH6Au
	EQMljQc4rYtXf/54TdI0CQvybq28YdFfEs9/1b17Ghnuk/qmUAQWHMDYzAjHTo0MCBVf
	JMFh3tKB5fPMsXikd4lWBJBVKlDM82v62uHQjVcssRj5SJTf3H07Xw1SYqRXtvBIWaF2
	XqZQ==
MIME-Version: 1.0
Received: by 10.50.236.74 with SMTP id us10mr1283835igc.5.1350474002570; Wed,
	17 Oct 2012 04:40:02 -0700 (PDT)
Received: by 10.64.24.179 with HTTP; Wed, 17 Oct 2012 04:40:02 -0700 (PDT)
In-Reply-To: <CAP9ODKrZ65fRPq7q8=u2VrBgqyCukgohoXuBng0Mbv0u4=wJaA@mail.gmail.com>
References: <1349166535-14325-1-git-send-email-s.stirtzel@googlemail.com>
	<CAP9ODKrNWnk_H0GjfM6sP8KNApRr=bGT0YaSEXp-8qMNq_GfZQ@mail.gmail.com>
	<CAGiJk9d+OabH=fROOS6Y8w-GNs8STaYgFVCBLZisKv2VDAd7JA@mail.gmail.com>
	<CAP9ODKrZ65fRPq7q8=u2VrBgqyCukgohoXuBng0Mbv0u4=wJaA@mail.gmail.com>
Date: Wed, 17 Oct 2012 13:40:02 +0200
Message-ID: <CAGiJk9cfToTY37FNux8RiSYu8mACQ_3sdCVkRV+79b8mR90xRg@mail.gmail.com>
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
X-List-Received-Date: Wed, 17 Oct 2012 11:53:21 -0000
Content-Type: text/plain; charset=UTF-8

2012/10/17 Otavio Salvador <otavio@ossystems.com.br>:
> On Wed, Oct 17, 2012 at 5:29 AM, Samuel Stirtzel
> <s.stirtzel@googlemail.com>wrote:
>
>> 2012/10/16 Otavio Salvador <otavio@ossystems.com.br>:
>> > On Tue, Oct 2, 2012 at 5:28 AM, Samuel Stirtzel
>> > <s.stirtzel@googlemail.com> wrote:
>> >> Maliit is a Qt based virtual keyboard under liberal license (LGPLv2.1 /
>> BSD)
>> >> The inputmethod framework from Qt is used and it supports gtk-immodules.
>> >> It can also be used without dependencies to GTK+ (separate package for
>> GTK+)
>> >>
>> >> Signed-off-by: Samuel Stirtzel <s.stirtzel@googlemail.com>
>> >
>> > Thanks by working on this. Bellow my comments ...
>> >
>> > ...
>> >> diff --git a/meta-oe/recipes-support/maliit/maliit-framework_git.bbb/meta-oe/recipes-support/maliit/
>> maliit-framework_git.bb
>> >> new file mode 100644
>> >> index 0000000..3f50d1b
>> >> --- /dev/null
>> >> +++ b/meta-oe/recipes-support/maliit/maliit-framework_git.bb
>> > ...
>> >> +
>> >> +# Maliit needs Qt configured with -accessibility, a patch for that was
>> already sent and will get merged in post 1.2.
>> >> +RDEPENDS_${PN} = "qt4-plugin-inputmethod-imsw-multi libqtsvg4"
>> >
>> > In this case, maliit is a post 1.2 package.
>> >
>> > ...
>> >> +EXTRA_QMAKEVARS_PRE = "\
>> >> +    PREFIX=${prefix} \
>> >> +    LIBDIR=${libdir} \
>> >> +    QT_IM_PLUGIN_PATH=${libdir}/qt4/plugins/inputmethods \
>> >> +    MALIIT_INSTALL_PRF=${datadir}/qt4/mkspecs/features \
>> >> +    SCHEMADIR=${sysconfdir}/gconf/schemas \
>> >> +    CONFIG+=disable-gconf \
>> >> +    CONFIG+=disable-gtk-cache-update \
>> >> +    CONFIG+=local-install \
>> >> +    "
>> >
>> > Really need to disable gtk-cache-update? Why?
>>
>> This option is for packaging, it disables running gtk-query-immodules
>> on the build-host
>>
>
> Are you sure it is about gtk-query-immodules, it seemed to be icon-cache
> related from  the option name.

It looks similar to existing options, but the Qt project file explains it:
http://gitorious.org/maliit/maliit-framework/blobs/master/maliit-framework.pro#line23

What it exactly does depends on the gtk version:
http://gitorious.org/maliit/maliit-framework/blobs/master/gtk-input-context/client-gtk/client-gtk.pro#line40
and
http://gitorious.org/maliit/maliit-framework/blobs/master/gtk-input-context/client-gtk3/client-gtk3.pro#line40

>
>
>>
>> >
>> > ...
>> >> +# Update the inputmethod modules in gtk
>> >> +pkg_postinst_${PN}-gtk() {
>> >> +if [ "x$D" != "x" ]; then
>> >> +    exit 1
>> >> +fi
>> >> +gtk-query-immodules-2.0 > /etc/gtk-2.0/gtk.immodules
>> >> +}
>> >> +
>> >> +pkg_postrm_${PN}-gtk() {
>> >> +if [ "x$D" != "x" ]; then
>> >> +    exit 1
>> >> +fi
>> >> +gtk-query-immodules-2.0 > /etc/gtk-2.0/gtk.immodules
>> >> +}
>> >
>> > You might add a gtk-immodules.bbclass to allow it to be put out of the
>> recipe.
>>
>> FYI: I have a class for this, but the only other recipe using
>> gtk-query-immodules is
>> openembedded-core/meta/recipes-sato/matchbox-keyboard/
>> matchbox-keyboard_git.bb
>> Should I send a patch with the .bbclass to oe-core?
>>
>
> I think so. It is easier to read and avoid code duplication.

Will do.

>
>
>>
>> >
>> > As said by Martin, please read the README and follow the steps to send
>> > the patch...
>>
>> Seems to be a classic case of -ENOCOFFEEYET
>>
>> Will re-send with the right prefix
>>
>
> hehe, right ...
>
> Take a double expresso coffee and try again ;-)
>
> --
> Otavio Salvador                             O.S. Systems
> E-mail: otavio@ossystems.com.br  http://www.ossystems.com.br
> Mobile: +55 53 9981-7854              http://projetos.ossystems.com.br
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel



-- 
Regards
Samuel


