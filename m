Received: from [80.91.229.2] (helo=ciao.gmane.org)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1LMhMd-0006pG-1i
	for openembedded-devel@openembedded.org; Tue, 13 Jan 2009 12:23:19 +0100
Received: from list by ciao.gmane.org with local (Exim 4.43)
	id 1LMhGH-00071S-MX
	for openembedded-devel@openembedded.org; Tue, 13 Jan 2009 11:16:45 +0000
Received: from s55917625.adsl.wanadoo.nl ([85.145.118.37])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@openembedded.org>;
	Tue, 13 Jan 2009 11:16:45 +0000
Received: from k.kooi by s55917625.adsl.wanadoo.nl with local (Gmexim 0.1
	(Debian)) id 1AlnuQ-0007hv-00
	for <openembedded-devel@openembedded.org>;
	Tue, 13 Jan 2009 11:16:45 +0000
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-devel@openembedded.org
From: Koen Kooi <k.kooi@student.utwente.nl>
Date: Tue, 13 Jan 2009 12:16:33 +0100
Message-ID: <gkht6i$2b6$1@ger.gmane.org>
References: <d6d644b80901130305j687168fapb3fa7659f2696742@mail.gmail.com>
Mime-Version: 1.0
X-Complaints-To: usenet@ger.gmane.org
X-Gmane-NNTP-Posting-Host: s55917625.adsl.wanadoo.nl
User-Agent: Mozilla/5.0 (Macintosh; U; Intel Mac OS X 10.5; en-US;
	rv:1.9.1b3pre) Gecko/20081230 Shredder/3.0b2pre
In-Reply-To: <d6d644b80901130305j687168fapb3fa7659f2696742@mail.gmail.com>
Sender: news <news@ger.gmane.org>
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
X-List-Received-Date: Tue, 13 Jan 2009 11:23:19 -0000
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 13-01-09 12:05, Erik Botö wrote:
> Hi,
>
> I'm writing a bitbake recipe for a QT-app that tries to link against
> libQtUiTools but it fails with:
>
> /bin/ld: cannot find -lQtUiTools
>
> I think this is because this file is not in the staging environment

Looking at qt_staging.inc:

     for i in libQtAssistantClient${QT_LIBINFIX} \
		libQtDesignerComponents${QT_LIBINFIX} \
		libQtUiTools${QT_LIBINFIX} \
		libQtDesigner${QT_LIBINFIX}
     do
         sed -i -e "s,-L${libdir},-L${STAGING_LIBDIR},g" $i.prl || true
         cp ${STAGE_TEMP}/${libdir}/$i.prl ${STAGING_LIBDIR} || true
         sed -i -e 
"/^dependency_libs=/s,-L${libdir},-L${STAGING_LIBDIR},g" $i.la || true
         cp ${STAGE_TEMP}/${libdir}/$i.la  ${STAGING_LIBDIR} || true
         oe_libinstall -C ${STAGE_TEMP}/${libdir} -so $i 
${STAGING_LIBDIR} || true
         oe_libinstall -C ${STAGE_TEMP}/${libdir} -a $i 
${STAGING_LIBDIR} || true
     done

So it attempts to install to .so (oe_libinstall -so) and the .a 
(oe_libinstall -a) to the staging dir.

> (I'm
> using qt-embedded-4.4.3 for building qt).

If you're building qt/e you should link against QtUiTools${QT_LIBINFIX} 
(expands to QtUiToolsE in your case), not QtUiTools. AIUI 'inherit 
qtopia4core' should take care of all that for you.

regards,

Koen



