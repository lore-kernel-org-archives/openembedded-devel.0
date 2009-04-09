Received: from [59.124.115.149] (helo=aakash.openmoko.org)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <nytowl@openmoko.org>) id 1LrxOZ-0003pt-1M
	for openembedded-devel@openembedded.org; Thu, 09 Apr 2009 18:46:34 +0200
Received: from s0106001c100a3234.cg.shawcable.net ([70.73.132.19]
	helo=[172.16.14.102]) by aakash.openmoko.org with esmtpsa (SSL
	3.0:DHE_RSA_AES_256_CBC_SHA1:32) (Exim 4.63)
	(envelope-from <nytowl@openmoko.org>) id 1LrxLF-0002x9-K4
	for openembedded-devel@openembedded.org; Fri, 10 Apr 2009 00:43:17 +0800
From: Angus Ainslie <nytowl@openmoko.org>
To: openembedded-devel@openembedded.org
Date: Thu, 09 Apr 2009 10:42:56 -0600
Message-Id: <1239295376.4784.179.camel@alap>
Mime-Version: 1.0
X-Mailer: Evolution 2.24.3 
X-SA-Exim-Connect-IP: 59.124.115.149
X-SA-Exim-Mail-From: nytowl@openmoko.org
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on serenity
X-Spam-Level: 
X-Spam-Status: No, score=-2.2 required=5.0 tests=AWL,BAYES_00,RDNS_NONE
	autolearn=no version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:14:11 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: [PATCH] epdfview: add page scrolling patch
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
X-List-Received-Date: Thu, 09 Apr 2009 16:46:34 -0000
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

From a3c28e2ab81cf7fd1ff49c6be0380075230722d2 Mon Sep 17 00:00:00 2001    
From: Previdi Roberto <previdi.roberto@gmail.com>                         
Date: Thu, 9 Apr 2009 10:26:51 -0600                                      
Subject: [PATCH] epdfview: add page scrolling patch                       

Signed-off-by: Angus Ainslie <nytowl@openmoko.org>
---                                               
 recipes/epdfview/epdfview_0.1.6.bb       |    3 +-
 recipes/epdfview/files/page-scroll.patch |   82 ++++++++++++++++++++++++++++++
 2 files changed, 84 insertions(+), 1 deletions(-)                             
 create mode 100644 recipes/epdfview/files/page-scroll.patch                   

diff --git a/recipes/epdfview/epdfview_0.1.6.bb b/recipes/epdfview/epdfview_0.1.6.bb
index 3cf2e5f..f4ec351 100644                                                       
--- a/recipes/epdfview/epdfview_0.1.6.bb                                            
+++ b/recipes/epdfview/epdfview_0.1.6.bb                                            
@@ -3,10 +3,11 @@ HOMEPAGE = "http://www.emma-soft.com/projects/epdfview/"          
 LICENSE = "GPLv2"                                                                  
 SECTION = "x11/applications"                                                       
 DEPENDS = "poppler gtk+ cups"                                                      
-PR = "r3"                                                                          
+PR = "r4"                                                                          
                                                                                    
 SRC_URI = "http://www.emma-soft.com/projects/epdfview/chrome/site/releases/epdfview-${PV}.tar.bz2 \
            file://poppler8.diff;patch=1 \                                                          
+           file://page-scroll.patch;patch=1 \                                                      
          "                                                                                         
                                                                                                    
 inherit autotools                                                                                  
diff --git a/recipes/epdfview/files/page-scroll.patch b/recipes/epdfview/files/page-scroll.patch    
new file mode 100644                                                                                
index 0000000..20fbfea                                                                              
--- /dev/null                                                                                       
+++ b/recipes/epdfview/files/page-scroll.patch                                                      
@@ -0,0 +1,82 @@                                                                                    
+diff -c -r -x '*.[ao]' -x '*~' -x '*anjuta*' patcher_original/epdfview-0.1.6/data/epdfview.desktop epdfview-0.1.6/data/epdfview.desktop
+*** patcher_original/epdfview-0.1.6/data/epdfview.desktop      2006-10-17 16:23:23.000000000 +0200                                     
+--- epdfview-0.1.6/data/epdfview.desktop       2009-04-07 16:39:43.000000000 +0200                                                     
+***************                                                                                                                        
+*** 8,14 ****                                                                                                                          
+  GenericName=PDF Viewer                                                                                                               
+  GenericName[ca]=Visor PDF                                                                                                            
+  GenericName[es]=Visor PDF                                                                                                            
+! Icon=postscript-viewer.png                                                                                                           
+  Name=ePDFViewer                                                                                                                      
+  Name[ca]=ePDFViewer                                                                                                                  
+  Name[es]=ePDFViewer                                                                                                                  
+--- 8,14 ----                                                                                                                          
+  GenericName=PDF Viewer                                                                                                               
+  GenericName[ca]=Visor PDF                                                                                                            
+  GenericName[es]=Visor PDF                                                                                                            
+! Icon=/usr/share/epdfview/pixmaps/icon_epdfview-48.png                                                                                
+  Name=ePDFViewer                                                                                                                      
+  Name[ca]=ePDFViewer                                                                                                                  
+  Name[es]=ePDFViewer                                                                                                                  
+diff -c -r -x '*.[ao]' -x '*~' -x '*anjuta*' patcher_original/epdfview-0.1.6/src/gtk/PageView.cxx epdfview-0.1.6/src/gtk/PageView.cxx  
+*** patcher_original/epdfview-0.1.6/src/gtk/PageView.cxx       2006-10-17 16:23:18.000000000 +0200                                     
+--- epdfview-0.1.6/src/gtk/PageView.cxx        2009-04-07 16:38:48.000000000 +0200                                                     
+***************                                                                                                                        
+*** 26,31 ****                                                                                                                         
+--- 26,32 ----                                                                                                                         
+                                                                                                                                       
+  // Constants                                                                                                                         
+  static gint PAGE_VIEW_PADDING = 12;                                                                                                  
++ static gint SCROLL_PAGE_DRAG_LENGTH = 50;                                                                                            
+                                                                                                                                       
+  // Forwards declarations.                                                                                                            
+  static gboolean page_view_button_press_cb (GtkWidget *, GdkEventButton *,                                                            
+***************                                                                                                                        
+*** 236,242 ****                                                                                                                       
+  void                                                                                                                                 
+  PageView::scrollPage (gdouble scrollX, gdouble scrollY, gint dx, gint dy)                                                            
+  {                                                                                                                                    
+!     GtkAdjustment *hAdjustment = gtk_scrolled_window_get_hadjustment (                                                               
+              GTK_SCROLLED_WINDOW (m_PageScroll));                                                                                     
+      gdouble hAdjValue = hAdjustment->page_size *                                                                                     
+          (gdouble)dx / m_PageImage->allocation.width;                                                                                 
+--- 237,245 ----                                                                                                                       
+  void                                                                                                                                 
+  PageView::scrollPage (gdouble scrollX, gdouble scrollY, gint dx, gint dy)                                                            
+  {                                                                                                                                    
+!      /* if the page cannot scroll and i'm dragging bottom to up, or left to right,
+!       i will go to the next page. viceversa previous page */
+!      GtkAdjustment *hAdjustment = gtk_scrolled_window_get_hadjustment (
+              GTK_SCROLLED_WINDOW (m_PageScroll));
+      gdouble hAdjValue = hAdjustment->page_size *
+          (gdouble)dx / m_PageImage->allocation.width;
+***************
+*** 253,258 ****
+--- 256,282 ----
+              CLAMP (scrollY - vAdjValue,
+                     vAdjustment->lower,
+                     vAdjustment->upper - vAdjustment->page_size));
++
++      /* if the page cannot scroll and i'm dragging bottom to up, or left to right,
++
++               i will go to the next page. viceversa previous page */
++      if ((scrollY==vAdjustment->upper - vAdjustment->page_size && dy<(0-SCROLL_PAGE_DRAG_LENGTH))
++              ||
++          (scrollX==hAdjustment->upper - hAdjustment->page_size && dx<(0-SCROLL_PAGE_DRAG_LENGTH))
++          )
++      {
++              m_Pter->scrollToNextPage();
++              m_Pter->mouseButtonReleased(1);
++      }
++      else
++      if((scrollY==vAdjustment->lower && dy>SCROLL_PAGE_DRAG_LENGTH)
++              ||
++          (scrollX==hAdjustment->lower && dx>SCROLL_PAGE_DRAG_LENGTH)
++          )
++      {
++              m_Pter->scrollToPreviousPage();
++              m_Pter->mouseButtonReleased(1);
++      }
+  }
+
+  void
--
1.5.6.3




