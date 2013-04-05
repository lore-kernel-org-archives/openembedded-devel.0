Received: from mail-ee0-f41.google.com ([74.125.83.41])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <koen@dominion.thruhere.net>) id 1UO3OZ-0005wL-Vh
	for openembedded-devel@lists.openembedded.org;
	Fri, 05 Apr 2013 11:57:22 +0200
Received: by mail-ee0-f41.google.com with SMTP id c1so1353556eek.28
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 05 Apr 2013 02:40:06 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=x-received:from:to:cc:subject:date:message-id:x-mailer:mime-version
	:content-type:content-transfer-encoding:x-gm-message-state;
	bh=1hxn/hpUrdpVFCgUNwvQYVmeJRjcWpm34lWtwKxQMps=;
	b=II8fol6WUlLHGBWaJntpM84IAxVDCUYXyDrYRvq1QeMV4oT7cnFndI+fif9py02FFi
	m7b3gKSHKMZjIwXgChtyLnFjgOf+xejyPcJRPfATh8prLZwi/1FkDh4DeWGqVmQg7lMc
	MDYv6SaJ8ZH+frwmGUfAsCoseLXf3W6id4EZVPnlR66jzKSiWfCuKgXIuoPq4Ta3M91W
	K0dsUsW+p7PrxAcXUlP1M3UgVUboZTDPixGuc8NLz66HHCDsWfJm07k6h61nLmokfLQB
	4HpRIiswVwsxKXCJxpgqD5HWZ3zEfOhfmFwzSUSCpbDgbR/YQwBrN1EwEOU5FKbX1IQb
	yc8g==
X-Received: by 10.14.3.70 with SMTP id 46mr18318234eeg.2.1365154806158;
	Fri, 05 Apr 2013 02:40:06 -0700 (PDT)
Received: from localhost.localdomain (ip4da2a5ae.direct-adsl.nl.
	[77.162.165.174])
	by mx.google.com with ESMTPS id bc1sm14403893eeb.11.2013.04.05.02.40.04
	(version=TLSv1.2 cipher=RC4-SHA bits=128/128);
	Fri, 05 Apr 2013 02:40:04 -0700 (PDT)
From: Koen Kooi <koen@dominion.thruhere.net>
To: openembedded-devel@lists.openembedded.org
Date: Fri,  5 Apr 2013 11:39:58 +0200
Message-Id: <1365154798-16687-1-git-send-email-koen@dominion.thruhere.net>
X-Mailer: git-send-email 1.8.1.4
MIME-Version: 1.0
X-Gm-Message-State: ALoCoQkIHhH3ADYpVDgdx+UF7KgWNU+6iGkW4ouqfbdiOe4oBmWkR9WioVS9PxfFSzA7NSNimMCf
Cc: Koen Kooi <koen@dominion.thruhere.net>, eric@eukrea.com
Subject: [meta-browser][PATCHv2] chromium 24.0.1312.52: add launch helper and .desktop file
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
X-List-Received-Date: Fri, 05 Apr 2013 09:57:22 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

The .desktop file is from the Fedora chrome RPM, the script is a custom one.

The launch helper has a nasty work around for root users, I'm open for better ways to work around that.

Signed-off-by: Koen Kooi <koen@dominion.thruhere.net>
---
 recipes-browser/chromium/chromium/google-chrome    |   7 +
 .../chromium/chromium/google-chrome.desktop        | 222 +++++++++++++++++++++
 recipes-browser/chromium/chromium_24.0.1312.52.bb  |   9 +-
 3 files changed, 237 insertions(+), 1 deletion(-)
 create mode 100755 recipes-browser/chromium/chromium/google-chrome
 create mode 100644 recipes-browser/chromium/chromium/google-chrome.desktop

diff --git a/recipes-browser/chromium/chromium/google-chrome b/recipes-browser/chromium/chromium/google-chrome
new file mode 100755
index 0000000..d5151ca
--- /dev/null
+++ b/recipes-browser/chromium/chromium/google-chrome
@@ -0,0 +1,7 @@
+#!/bin/sh
+
+if [ "${USER}" = "root" ] ; then 
+	su -c /usr/bin/chrome/chrome $@ - xuser
+else
+	/usr/bin/chrome/chrome $@
+fi
diff --git a/recipes-browser/chromium/chromium/google-chrome.desktop b/recipes-browser/chromium/chromium/google-chrome.desktop
new file mode 100644
index 0000000..d29fdb2
--- /dev/null
+++ b/recipes-browser/chromium/chromium/google-chrome.desktop
@@ -0,0 +1,222 @@
+[Desktop Entry]
+Version=1.0
+Name=Chromium
+# Only KDE 4 seems to use GenericName, so we reuse the KDE strings.
+# From Ubuntu's language-pack-kde-XX-base packages, version 9.04-20090413.
+GenericName=Web Browser
+GenericName[ar]=متصفح الشبكة
+GenericName[bg]=Уеб браузър
+GenericName[ca]=Navegador web
+GenericName[cs]=WWW prohlížeč
+GenericName[da]=Browser
+GenericName[de]=Web-Browser
+GenericName[el]=Περιηγητής ιστού
+GenericName[en_GB]=Web Browser
+GenericName[es]=Navegador web
+GenericName[et]=Veebibrauser
+GenericName[fi]=WWW-selain
+GenericName[fr]=Navigateur Web
+GenericName[gu]=વેબ બ્રાઉઝર
+GenericName[he]=דפדפן אינטרנט
+GenericName[hi]=वेब ब्राउज़र
+GenericName[hu]=Webböngésző
+GenericName[it]=Browser Web
+GenericName[ja]=ウェブブラウザ
+GenericName[kn]=ಜಾಲ ವೀಕ್ಷಕ
+GenericName[ko]=웹 브라우저
+GenericName[lt]=Žiniatinklio naršyklė
+GenericName[lv]=Tīmekļa pārlūks
+GenericName[ml]=വെബ് ബ്രൌസര്‍
+GenericName[mr]=वेब ब्राऊजर
+GenericName[nb]=Nettleser
+GenericName[nl]=Webbrowser
+GenericName[pl]=Przeglądarka WWW
+GenericName[pt]=Navegador Web
+GenericName[pt_BR]=Navegador da Internet
+GenericName[ro]=Navigator de Internet
+GenericName[ru]=Веб-браузер
+GenericName[sl]=Spletni brskalnik
+GenericName[sv]=Webbläsare
+GenericName[ta]=இணைய உலாவி
+GenericName[th]=เว็บเบราว์เซอร์
+GenericName[tr]=Web Tarayıcı
+GenericName[uk]=Навігатор Тенет
+GenericName[zh_CN]=网页浏览器
+GenericName[zh_HK]=網頁瀏覽器
+GenericName[zh_TW]=網頁瀏覽器
+# Not translated in KDE, from Epiphany 2.26.1-0ubuntu1.
+GenericName[bn]=ওয়েব ব্রাউজার
+GenericName[fil]=Web Browser
+GenericName[hr]=Web preglednik
+GenericName[id]=Browser Web
+GenericName[or]=ଓ୍ବେବ ବ୍ରାଉଜର
+GenericName[sk]=WWW prehliadač
+GenericName[sr]=Интернет прегледник
+GenericName[te]=మహాతల అన్వేషి
+GenericName[vi]=Bộ duyệt Web
+# Gnome and KDE 3 uses Comment.
+Comment=Access the Internet
+Comment[ar]=الدخول إلى الإنترنت
+Comment[bg]=Достъп до интернет
+Comment[bn]=ইন্টারনেটটি অ্যাক্সেস করুন
+Comment[ca]=Accedeix a Internet
+Comment[cs]=Přístup k internetu
+Comment[da]=Få adgang til internettet
+Comment[de]=Internetzugriff
+Comment[el]=Πρόσβαση στο Διαδίκτυο
+Comment[en_GB]=Access the Internet
+Comment[es]=Accede a Internet.
+Comment[et]=Pääs Internetti
+Comment[fi]=Käytä internetiä
+Comment[fil]=I-access ang Internet
+Comment[fr]=Accéder à Internet
+Comment[gu]=ઇંટરનેટ ઍક્સેસ કરો
+Comment[he]=גישה אל האינטרנט
+Comment[hi]=इंटरनेट तक पहुंच स्थापित करें
+Comment[hr]=Pristup Internetu
+Comment[hu]=Internetelérés
+Comment[id]=Akses Internet
+Comment[it]=Accesso a Internet
+Comment[ja]=インターネットにアクセス
+Comment[kn]=ಇಂಟರ್ನೆಟ್ ಅನ್ನು ಪ್ರವೇಶಿಸಿ
+Comment[ko]=인터넷 연결
+Comment[lt]=Interneto prieiga
+Comment[lv]=Piekļūt internetam
+Comment[ml]=ഇന്റര്‍‌നെറ്റ് ആക്‌സസ് ചെയ്യുക
+Comment[mr]=इंटरनेटमध्ये प्रवेश करा
+Comment[nb]=Gå til Internett
+Comment[nl]=Verbinding maken met internet
+Comment[or]=ଇଣ୍ଟର୍ନେଟ୍ ପ୍ରବେଶ କରନ୍ତୁ
+Comment[pl]=Skorzystaj z internetu
+Comment[pt]=Aceder à Internet
+Comment[pt_BR]=Acessar a internet
+Comment[ro]=Accesaţi Internetul
+Comment[ru]=Доступ в Интернет
+Comment[sk]=Prístup do siete Internet
+Comment[sl]=Dostop do interneta
+Comment[sr]=Приступите Интернету
+Comment[sv]=Gå ut på Internet
+Comment[ta]=இணையத்தை அணுகுதல்
+Comment[te]=ఇంటర్నెట్‌ను ఆక్సెస్ చెయ్యండి
+Comment[th]=เข้าถึงอินเทอร์เน็ต
+Comment[tr]=İnternet'e erişin
+Comment[uk]=Доступ до Інтернету
+Comment[vi]=Truy cập Internet
+Comment[zh_CN]=访问互联网
+Comment[zh_HK]=連線到網際網路
+Comment[zh_TW]=連線到網際網路
+Exec=/usr/bin/google-chrome %U
+Terminal=false
+Icon=google-chrome
+Type=Application
+Categories=Network;WebBrowser;
+MimeType=text/html;text/xml;application/xhtml_xml;x-scheme-handler/http;x-scheme-handler/https;x-scheme-handler/ftp;
+X-Ayatana-Desktop-Shortcuts=NewWindow;NewIncognito
+
+[NewWindow Shortcut Group]
+Name=New Window
+Name[am]=አዲስ መስኮት
+Name[ar]=نافذة جديدة
+Name[bg]=Нов прозорец
+Name[bn]=নতুন উইন্ডো
+Name[ca]=Finestra nova
+Name[cs]=Nové okno
+Name[da]=Nyt vindue
+Name[de]=Neues Fenster
+Name[el]=Νέο Παράθυρο
+Name[en_GB]=New Window
+Name[es]=Nueva ventana
+Name[et]=Uus aken
+Name[fa]=پنجره جدید
+Name[fi]=Uusi ikkuna
+Name[fil]=New Window
+Name[fr]=Nouvelle fenêtre
+Name[gu]=નવી વિંડો
+Name[hi]=नई विंडो
+Name[hr]=Novi prozor
+Name[hu]=Új ablak
+Name[id]=Jendela Baru
+Name[it]=Nuova finestra
+Name[iw]=חלון חדש
+Name[ja]=新規ウインドウ
+Name[kn]=ಹೊಸ ವಿಂಡೊ
+Name[ko]=새 창
+Name[lt]=Naujas langas
+Name[lv]=Jauns logs
+Name[ml]=പുതിയ വിന്‍ഡോ
+Name[mr]=नवीन विंडो
+Name[nl]=Nieuw venster
+Name[no]=Nytt vindu
+Name[pl]=Nowe okno
+Name[pt]=Nova janela
+Name[pt_BR]=Nova janela
+Name[ro]=Fereastră nouă
+Name[ru]=Новое окно
+Name[sk]=Nové okno
+Name[sl]=Novo okno
+Name[sr]=Нови прозор
+Name[sv]=Nytt fönster
+Name[sw]=Dirisha Jipya
+Name[ta]=புதிய சாளரம்
+Name[te]=క్రొత్త విండో
+Name[th]=หน้าต่างใหม่
+Name[tr]=Yeni Pencere
+Name[uk]=Нове вікно
+Name[vi]=Cửa sổ Mới
+Name[zh_CN]=新建窗口
+Name[zh_TW]=開新視窗
+Exec=/usr/bin/google-chrome
+TargetEnvironment=Unity
+
+[NewIncognito Shortcut Group]
+Name=New Incognito Window
+Name[ar]=نافذة جديدة للتصفح المتخفي
+Name[bg]=Нов прозорец „инкогнито“
+Name[bn]=নতুন ছদ্মবেশী উইন্ডো
+Name[ca]=Finestra d'incògnit nova
+Name[cs]=Nové anonymní okno
+Name[da]=Nyt inkognitovindue
+Name[de]=Neues Inkognito-Fenster
+Name[el]=Νέο παράθυρο για ανώνυμη περιήγηση
+Name[en_GB]=New Incognito window
+Name[es]=Nueva ventana de incógnito
+Name[et]=Uus inkognito aken
+Name[fa]=پنجره جدید حالت ناشناس
+Name[fi]=Uusi incognito-ikkuna
+Name[fil]=Bagong Incognito window
+Name[fr]=Nouvelle fenêtre de navigation privée
+Name[gu]=નવી છુપી વિંડો
+Name[hi]=नई गुप्त विंडो
+Name[hr]=Novi anoniman prozor
+Name[hu]=Új Inkognitóablak
+Name[id]=Jendela Penyamaran baru
+Name[it]=Nuova finestra di navigazione in incognito
+Name[iw]=חלון חדש לגלישה בסתר
+Name[ja]=新しいシークレット ウィンドウ
+Name[kn]=ಹೊಸ ಅಜ್ಞಾತ ವಿಂಡೋ
+Name[ko]=새 시크릿 창
+Name[lt]=Naujas inkognito langas
+Name[lv]=Jauns inkognito režīma logs
+Name[ml]=പുതിയ വേഷ പ്രച്ഛന്ന വിന്‍ഡോ
+Name[mr]=नवीन गुप्त विंडो
+Name[nl]=Nieuw incognitovenster
+Name[no]=Nytt inkognitovindu
+Name[pl]=Nowe okno incognito
+Name[pt]=Nova janela de navegação anónima
+Name[pt_BR]=Nova janela anônima
+Name[ro]=Fereastră nouă incognito
+Name[ru]=Новое окно в режиме инкогнито
+Name[sk]=Nové okno inkognito
+Name[sl]=Novo okno brez beleženja zgodovine
+Name[sr]=Нови прозор за прегледање без архивирања
+Name[sv]=Nytt inkognitofönster
+Name[ta]=புதிய மறைநிலைச் சாளரம்
+Name[te]=క్రొత్త అజ్ఞాత విండో
+Name[th]=หน้าต่างใหม่ที่ไม่ระบุตัวตน
+Name[tr]=Yeni Gizli pencere
+Name[uk]=Нове вікно в режимі анонімного перегляду
+Name[vi]=Cửa sổ ẩn danh mới
+Name[zh_CN]=新建隐身窗口
+Name[zh_TW]=新增無痕式視窗
+Exec=/usr/bin/google-chrome --incognito
+TargetEnvironment=Unity
diff --git a/recipes-browser/chromium/chromium_24.0.1312.52.bb b/recipes-browser/chromium/chromium_24.0.1312.52.bb
index 3976a71..ab0fb4b 100644
--- a/recipes-browser/chromium/chromium_24.0.1312.52.bb
+++ b/recipes-browser/chromium/chromium_24.0.1312.52.bb
@@ -9,6 +9,8 @@ SRC_URI = "http://commondatastorage.googleapis.com/chromium-browser-official/${P
         file://unistd-2.patch \
         file://glib-2.16-use-siginfo_t.patch \
         file://ui-gl-no-narrowing.patch \
+        file://google-chrome \
+        file://google-chrome.desktop \
 "
 
 # include.gypi exists only for armv6 and armv7a and there isn't something like COMPATIBLE_ARCH afaik
@@ -49,6 +51,11 @@ do_compile() {
 
 do_install() {
 	install -d ${D}${bindir}
+	install -m 0755 ${WORKDIR}/google-chrome ${D}${bindir}/
+
+	install -d ${D}${datadir}/applications
+	install -m 0644 ${WORKDIR}/google-chrome.desktop ${D}${datadir}/applications/
+
 	install -d ${D}${bindir}/chrome/
 	install -m 0755 ${S}/out/Release/chrome ${D}${bindir}/chrome/chrome
 	install -m 0644 ${S}/out/Release/chrome.pak ${D}${bindir}/chrome/
@@ -61,5 +68,5 @@ do_install() {
 	install -m 0644 ${S}/out/Release/locales/en-US.pak ${D}${bindir}/chrome/locales
 }
 
-FILES_${PN} = "${bindir}/chrome/"
+FILES_${PN} = "${bindir}/chrome/ ${bindir}/google-chrome ${datadir}/applications"
 FILES_${PN}-dbg = "${bindir}/chrome/.debug/"
-- 
1.8.1.4



