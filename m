Received: from [209.85.200.173] (helo=wf-out-1314.google.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <erik.boto@gmail.com>) id 1LMjPF-0004Kb-KI
	for openembedded-devel@lists.openembedded.org;
	Tue, 13 Jan 2009 14:34:10 +0100
Received: by wf-out-1314.google.com with SMTP id 29so4279wff.3
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 13 Jan 2009 05:27:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:in-reply-to:references
	:date:message-id:subject:from:to:content-type;
	bh=p8IeBjKPzlvZ22n6lHc32ZC2KTbcvBNEh29sAYx1jqg=;
	b=fv/CWVCZW3ptEeX99fkXC8Yy1bGmun9Eb+dW3pMHHCUmwqXSD2j1Mq+NvMqvJ2Burt
	gxTibAMPNX6VngvtqpAzFYeeoYt97KlnTFNvx+vZJhBfU4PuKVdS+nZ1Rw3pRWgSqK5L
	YxACGDz9p+X6/6IwVXMkuRI0uIAtkCtxNxaTQ=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type;
	b=osMptY2sl1RSndsaNzp8nO+IRmsqY9gCqX4zo8zIDwkIO9tnc/N3sHa9iClW5Btm5j
	VqVeSYwqAzKgc3gOINYIDV6xwulMBDNzb0NNhaD9lh5zf2ihXWzeMGbDNzppRy2PUbs1
	d8KKTjsSwedRl5Vq4mjEoVbwIz0gfgmST0RYg=
MIME-Version: 1.0
Received: by 10.142.141.21 with SMTP id o21mr9448348wfd.126.1231853257891; 
	Tue, 13 Jan 2009 05:27:37 -0800 (PST)
In-Reply-To: <gkht6i$2b6$1@ger.gmane.org>
References: <d6d644b80901130305j687168fapb3fa7659f2696742@mail.gmail.com>
	<gkht6i$2b6$1@ger.gmane.org>
Date: Tue, 13 Jan 2009 14:27:37 +0100
Message-ID: <d6d644b80901130527x62dca925wfff7c91e14a4671f@mail.gmail.com>
From: =?ISO-8859-1?Q?Erik_Bot=F6?= <erik.boto@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-Content-Filtered-By: Mailman/MimeDel 2.1.11
Subject: Re: Qt-app won't build since libQtUiTools not included in staging
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
X-List-Received-Date: Tue, 13 Jan 2009 13:34:19 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

Hi again!

When I build qt-embedded I get the "E" suffix on all libraries but
QtUiTools. If I enter the workdir for qt-embedded and lists the content of
the lib-dir I have all the .la libraries with the E suffix, like
"libQtGuiE.la" etc. But the QtUiTools file is called "libQtUiTools.a"
without the "E". So if qt_staging.inc expects the suffix to be there I gues=
s
it won't find the file?

Is the QtUiTools some kind of exception, or should it also be suffixed with
an E?

Best regards,
Erik


On Tue, Jan 13, 2009 at 12:16 PM, Koen Kooi <k.kooi@student.utwente.nl>wrot=
e:

> On 13-01-09 12:05, Erik Bot=F6 wrote:
>
>> Hi,
>>
>> I'm writing a bitbake recipe for a QT-app that tries to link against
>> libQtUiTools but it fails with:
>>
>> /bin/ld: cannot find -lQtUiTools
>>
>> I think this is because this file is not in the staging environment
>>
>
> Looking at qt_staging.inc:
>
>    for i in libQtAssistantClient${QT_LIBINFIX} \
>                libQtDesignerComponents${QT_LIBINFIX} \
>                libQtUiTools${QT_LIBINFIX} \
>                libQtDesigner${QT_LIBINFIX}
>    do
>        sed -i -e "s,-L${libdir},-L${STAGING_LIBDIR},g" $i.prl || true
>        cp ${STAGE_TEMP}/${libdir}/$i.prl ${STAGING_LIBDIR} || true
>        sed -i -e "/^dependency_libs=3D/s,-L${libdir},-L${STAGING_LIBDIR},=
g" $
> i.la || true
>        cp ${STAGE_TEMP}/${libdir}/$i.la  ${STAGING_LIBDIR} || true
>        oe_libinstall -C ${STAGE_TEMP}/${libdir} -so $i ${STAGING_LIBDIR} =
||
> true
>        oe_libinstall -C ${STAGE_TEMP}/${libdir} -a $i ${STAGING_LIBDIR} |=
|
> true
>    done
>
> So it attempts to install to .so (oe_libinstall -so) and the .a
> (oe_libinstall -a) to the staging dir.
>
>  (I'm
>> using qt-embedded-4.4.3 for building qt).
>>
>
> If you're building qt/e you should link against QtUiTools${QT_LIBINFIX}
> (expands to QtUiToolsE in your case), not QtUiTools. AIUI 'inherit
> qtopia4core' should take care of all that for you.
>
> regards,
>
> Koen
>
>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>

