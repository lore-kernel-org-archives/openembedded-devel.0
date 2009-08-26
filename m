Received: from [203.97.37.64] (helo=smtp4.clear.net.nz)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <matthew@4d-electronics.co.nz>) id 1MgQST-0007un-GE
	for openembedded-devel@lists.openembedded.org;
	Wed, 26 Aug 2009 23:55:10 +0200
Received: from tardis.4d-electronics.co.nz
	(202-0-56-223.cable.telstraclear.net [202.0.56.223])
	by smtp4.clear.net.nz (CLEAR Net Mail)
	with ESMTP id <0KP000EJG6OIQP10@smtp4.clear.net.nz> for
	openembedded-devel@lists.openembedded.org; Thu,
	27 Aug 2009 09:36:19 +1200 (NZST)
Received: from localhost (localhost [127.0.0.1])	by tardis.4d-electronics.co.nz
	(Postfix) with ESMTP id 5086B5CE258	for
	<openembedded-devel@lists.openembedded.org>; Thu,
	27 Aug 2009 09:36:18 +1200 (NZST)
Received: from tardis.4d-electronics.co.nz ([127.0.0.1])
	by localhost (tardis.4d-electronics.co.nz [127.0.0.1])
	(amavisd-new, port 10024)	with ESMTP id 0-USQg6hGa1d	for
	<openembedded-devel@lists.openembedded.org>; Thu,
	27 Aug 2009 09:36:17 +1200 (NZST)
Received: from [192.168.1.129] (unknown [192.168.1.129])
	by tardis.4d-electronics.co.nz (Postfix) with ESMTPS id E3AD65CE222	for
	<openembedded-devel@lists.openembedded.org>; Thu,
	27 Aug 2009 09:36:17 +1200 (NZST)
Date: Thu, 27 Aug 2009 09:36:17 +1200
From: Matthew Dombroski <matthew@4d-electronics.co.nz>
In-reply-to: <4A9516B5.9000602@epfl.ch>
To: openembedded-devel@lists.openembedded.org
Message-id: <4A95AAD1.4040703@4d-electronics.co.nz>
MIME-version: 1.0
X-Virus-Scanned: by Amavis+SpamAssassin+ClamAV and more at	4d-electronics.co.nz
X-Spam-Flag: NO
X-Spam-Score: -1.44
References: <4A937831.2000304@4d-electronics.co.nz> <4A93A9E3.7090605@epfl.ch>
	<4A9461C3.2000406@4d-electronics.co.nz> <4A94DA90.8090306@epfl.ch>
	<4A9516B5.9000602@epfl.ch>
User-Agent: Mozilla/5.0 (X11; U; Linux i686; en-GB; rv:1.9.1.1) Gecko/20090715
	Thunderbird/3.0b3
X-Spam-Status: No, score=-1.44 tagged_above=-99 required=5
	tests=[ALL_TRUSTED=-1.44]
X-Spam-Level: 
Subject: Re: [PATCH] Add toolchain file generation to cmake bbclass
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
X-List-Received-Date: Wed, 26 Aug 2009 21:55:22 -0000
Content-type: text/plain; charset=ISO-8859-1; format=flowed
Content-transfer-encoding: 7bit

> I have tried it, and the only thing I now have in the EXTRA_OECMAKE is 
> QT_QMAKE_EXECUTABLE to be sure that it takes the one from staging and 
> not the one from my system.
>
>> inherit qt4e cmake
>> EXTRA_OECMAKE += "-DSHARED_LIBS:BOOL=ON -DCMD_LINE:BOOL=ON \
>>         -DQT_QMAKE_EXECUTABLE=${OE_QMAKE_QMAKE} \
>>         "
>>
>> export QT_CONF_PATH="${WORKDIR}/trunk/qt.conf"
>>
>> do_configure_prepend() {
>>     echo "[Paths]" > $QT_CONF_PATH
>>     echo "Prefix=${STAGING_DIR}/${HOST_SYS}/usr" >> $QT_CONF_PATH
>>     echo "Documentation=${docdir}/${QT_DIR_NAME}" >> $QT_CONF_PATH
>>     echo "Headers=${STAGING_INCDIR}/${QT_DIR_NAME}" >> $QT_CONF_PATH
>>     echo "Libraries=${STAGING_LIBDIR}" >> $QT_CONF_PATH
>>     echo "Binaries=${STAGING_BINDIR_NATIVE}" >> $QT_CONF_PATH
>>     echo "Plugins=${libdir}/${QT_DIR_NAME}/plugins" >> $QT_CONF_PATH
>>     echo "Data=${datadir}/${QT_DIR_NAME}" >> $QT_CONF_PATH
>>     echo "Translations=${datadir}/${QT_DIR_NAME}/translations" >> 
>> $QT_CONF_PATH
>>     echo "Settings=${sysconfdir}/${QT_DIR_NAME}" >> $QT_CONF_PATH
>>     echo "Examples=${bindir}/${QT_DIR_NAME}/examples" >> $QT_CONF_PATH
>>     echo "Demos=${bindir}/${QT_DIR_NAME}/demos" >> $QT_CONF_PATH
>> }
>>
That looks quite good now, maybe it's a good idea to add a 
generate_qt_conf() to qmake2.bbclass.
That way it's independent of what build system we're using.

~Matt



