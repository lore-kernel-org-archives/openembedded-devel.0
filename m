Received: from [128.178.224.226] (helo=smtp3.epfl.ch)
	by linuxtogo.org with smtp (Exim 4.69)
	(envelope-from <valentin.longchamp@epfl.ch>) id 1MHPc8-00089K-9s
	for openembedded-devel@openembedded.org; Thu, 18 Jun 2009 23:57:45 +0200
Received: (qmail 18238 invoked by uid 107); 18 Jun 2009 21:47:07 -0000
X-Virus-Scanned: ClamAV
Received: from unknown (85.4.79.108) (authenticated)
	by smtp3.epfl.ch (AngelmatoPhylax SMTP proxy);
	Thu, 18 Jun 2009 23:47:08 +0200
Message-ID: <4A3AB5D2.6060600@epfl.ch>
Date: Thu, 18 Jun 2009 23:46:58 +0200
From: Valentin Longchamp <valentin.longchamp@epfl.ch>
User-Agent: Thunderbird 2.0.0.21 (X11/20090409)
MIME-Version: 1.0
To: "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
References: <1245344614-22213-1-git-send-email-valentin.longchamp@epfl.ch>	<1245344614-22213-2-git-send-email-valentin.longchamp@epfl.ch>
	<fce2a370906181257h659a4259wff2c00e1d66ff667@mail.gmail.com>
In-Reply-To: <fce2a370906181257h659a4259wff2c00e1d66ff667@mail.gmail.com>
Subject: Re: [PATCH] change qmake2 to qmake4 for consistency
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
X-List-Received-Date: Thu, 18 Jun 2009 21:57:47 -0000
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Ihar Hrachyshka wrote:
> On Thu, Jun 18, 2009 at 8:03 PM, Valentin
> Longchamp<valentin.longchamp@epfl.ch> wrote:
>> Signed-off-by: Valentin Longchamp <valentin.longchamp@epfl.ch>
>> ---
>>  classes/qmake2.bbclass           |   21 ---------------------
>>  classes/qmake4.bbclass           |   21 +++++++++++++++++++++
>>  recipes/qt4/qt4-tools-native.inc |    3 +--
>>  3 files changed, 22 insertions(+), 23 deletions(-)
>>  delete mode 100644 classes/qmake2.bbclass
>>  create mode 100644 classes/qmake4.bbclass
>>
>> diff --git a/classes/qmake2.bbclass b/classes/qmake2.bbclass
>> deleted file mode 100644
>> index 26e813a..0000000
>> --- a/classes/qmake2.bbclass
>> +++ /dev/null
>> @@ -1,21 +0,0 @@
>> -#
>> -# QMake variables for Qt4
>> -#
>> -inherit qmake_base
>> -
>> -DEPENDS_prepend = "qt4-tools-native "
>> -
>> -export QMAKESPEC = "${STAGING_DATADIR}/qt4/mkspecs/${TARGET_OS}-oe-g++"
>> -export OE_QMAKE_UIC = "${STAGING_BINDIR_NATIVE}/uic4"
>> -export OE_QMAKE_UIC3 = "${STAGING_BINDIR_NATIVE}/uic34"
>> -export OE_QMAKE_MOC = "${STAGING_BINDIR_NATIVE}/moc4"
>> -export OE_QMAKE_RCC = "${STAGING_BINDIR_NATIVE}/rcc4"
>> -export OE_QMAKE_QDBUSCPP2XML = "${STAGING_BINDIR_NATIVE}/qdbuscpp2xml4"
>> -export OE_QMAKE_QDBUSXML2CPP = "${STAGING_BINDIR_NATIVE}/qdbusxml2cpp4"
>> -export OE_QMAKE_QMAKE = "${STAGING_BINDIR_NATIVE}/qmake2"
>> -export OE_QMAKE_LINK = "${CXX}"
>> -export OE_QMAKE_CXXFLAGS = "${CXXFLAGS}"
>> -export OE_QMAKE_INCDIR_QT = "${STAGING_INCDIR}/qt4"
>> -export OE_QMAKE_LIBDIR_QT = "${STAGING_LIBDIR}"
>> -export OE_QMAKE_LIBS_QT = "qt"
>> -export OE_QMAKE_LIBS_X11 = "-lXext -lX11 -lm"
>> diff --git a/classes/qmake4.bbclass b/classes/qmake4.bbclass
>> new file mode 100644
>> index 0000000..c5ce100
>> --- /dev/null
>> +++ b/classes/qmake4.bbclass
>> @@ -0,0 +1,21 @@
>> +#
>> +# QMake variables for Qt4
>> +#
>> +inherit qmake_base
>> +
>> +DEPENDS_prepend = "qt4-tools-native "
>> +
>> +export QMAKESPEC = "${STAGING_DATADIR}/qt4/mkspecs/${TARGET_OS}-oe-g++"
>> +export OE_QMAKE_UIC = "${STAGING_BINDIR_NATIVE}/uic4"
>> +export OE_QMAKE_UIC3 = "${STAGING_BINDIR_NATIVE}/uic34"
>> +export OE_QMAKE_MOC = "${STAGING_BINDIR_NATIVE}/moc4"
>> +export OE_QMAKE_RCC = "${STAGING_BINDIR_NATIVE}/rcc4"
>> +export OE_QMAKE_QDBUSCPP2XML = "${STAGING_BINDIR_NATIVE}/qdbuscpp2xml4"
>> +export OE_QMAKE_QDBUSXML2CPP = "${STAGING_BINDIR_NATIVE}/qdbusxml2cpp4"
>> +export OE_QMAKE_QMAKE = "${STAGING_BINDIR_NATIVE}/qmake4"
>> +export OE_QMAKE_LINK = "${CXX}"
>> +export OE_QMAKE_CXXFLAGS = "${CXXFLAGS}"
>> +export OE_QMAKE_INCDIR_QT = "${STAGING_INCDIR}/qt4"
>> +export OE_QMAKE_LIBDIR_QT = "${STAGING_LIBDIR}"
>> +export OE_QMAKE_LIBS_QT = "qt"
>> +export OE_QMAKE_LIBS_X11 = "-lXext -lX11 -lm"
>> diff --git a/recipes/qt4/qt4-tools-native.inc b/recipes/qt4/qt4-tools-native.inc
>> index 0fd4f92..5d1a781 100644
>> --- a/recipes/qt4/qt4-tools-native.inc
>> +++ b/recipes/qt4/qt4-tools-native.inc
>> @@ -60,8 +60,7 @@ do_compile() {
>>
>>  do_stage() {
>>     install -d ${STAGING_BINDIR_NATIVE}/
>> -    install -m 0755 bin/qmake ${STAGING_BINDIR_NATIVE}/qmake2
>> -    for i in moc uic uic3 rcc lrelease lupdate qdbuscpp2xml qdbusxml2cpp; do
>> +    for i in qmake moc uic uic3 rcc lrelease lupdate qdbuscpp2xml qdbusxml2cpp; do
>>         install -m 0755 bin/${i} ${STAGING_BINDIR_NATIVE}/${i}4
>>     done
> 
> 1) qmake name should be changed for qt4-tools-sdk too.
> 2) no inherit qmake2 -> inherit qmake4 changes done.
> 
> If this is fixed I'll vote for the change.
> 

Sure, I did not send the whole patch since it only is a RFC (see the 
other mail I have just sent before). All these changes are ready to be sent.

I'll send it tomorrow morning.

Val

-- 
Valentin Longchamp, PhD Student, EPFL-STI-LSRO1
valentin.longchamp@epfl.ch, Phone: +41216937827
http://people.epfl.ch/valentin.longchamp
MEA3485, Station 9, CH-1015 Lausanne


